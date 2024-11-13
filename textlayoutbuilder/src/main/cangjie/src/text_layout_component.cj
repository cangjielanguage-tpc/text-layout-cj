/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */
package textlayoutbuilder

import ohos.base.*
import ohos.component.*
import ohos.state_manage.*
import ohos.state_macro_manage.*
import std.regex.*
import std.collection.{ArrayList}
import std.math.*
import ohos.hilog.Hilog

let TEXT_TYPE_NORMAL: String = "normal"
let TEXT_TYPE_RICH: String = "richtext"
let TEXT_TYPE_HTTP: String = "http"

@Component
public class TextLayout {
    @State
    var model: Layout = Layout()
    @State
    var eventType: EventType = NONE

    func build() {
        Flex() {
            Text() {
                ForEach(
                    this.getTextLayout(),
                    itemGeneratorFunc: {
                        item: TextInfo, index: Int64 => if (item.getTextType() == TEXT_TYPE_RICH) {
                            // 特殊处理的字符串
                            Span(
                                if (this.model.textDirection == 0) {
                                item.getText()
                            } else {
                                this.stringReverse(item.getText())
                            }).fontSize(item.getFontSize()).letterSpacing(item.getFontLetterSpacing()).fontColor(
                                item.getFontColor()).fontStyle(item.getFontStyle()).onClick(
                                {
                                event => this.model.clickCallback(item)
                            })
                        } else if (item.getTextType() == TEXT_TYPE_HTTP) { // 链接字符串
                            Span(
                                if (this.model.textDirection == 0) {
                                item.getText()
                            } else {
                                this.stringReverse(item.getText())
                            }).fontSize(if (this.model.status) {
                                this.model.size
                            } else {
                                this.model.size - 4.0
                            }).fontColor(this.model.linkColor).decoration(
                                decorationType: TextDecorationType.Underline,
                                color: this.model.linkColor
                            ).fontStyle(this.model.style)
                        } else if (item.getTextType() == TEXT_TYPE_NORMAL) { // 正常文字
                            Span(
                                if (this.model.textDirection == 0) {
                                item.getText()
                            } else {
                                this.stringReverse(item.getText())
                            }).fontSize(this.model.size).letterSpacing(this.model.letterSpacing).fontColor(
                                this.model.textColor).fontStyle(this.model.style)
                        }
                    }
                )
            }.fontFamily(this.model.typeface).borderRadius(10).textAlign(this.model.textalign).padding(
                left: if (this.model.shouldInclude) {
                    this.model.leftIndents
                } else {
                    14.0
                },
                right: if (this.model.shouldInclude) {
                    this.model.rightIndents
                } else {
                    14.0
                },
                top: if (this.model.shouldInclude) {
                    14.0
                } else {
                    0.0
                },
                bottom: if (this.model.shouldInclude) {
                    14.0
                } else {
                    0.0
                }
            ).constraintSize(
                minWidth: this.getMinWidthEms().vp,
                maxWidth: this.getMaxWidthEms().vp,
            ).maxLines(
                if (this.model.singleLine) {
                1
            } else if (this.model.maxLines != 0) {
                this.model.maxLines
            } else {
                Int32.Max
            })
                .textOverflow(this.model.ellipsize).backgroundColor(
                if (this.eventType.toNum() == EventType.DOWN.toNum()) {
                this.getTextLayoutBgColor()
            } else {
                this.model.bgColor
            }).lineHeight(30)
                .width(this.model.width).onTouch(
                {
                event => if (event.eventType.toString() == TouchType.Down.toString()) {
                    this.eventType = EventType.DOWN
                } else if (event.eventType.toString() == TouchType.Up.toString()) {
                    this.eventType = EventType.UP
                } else if (event.eventType.toString() == TouchType.Move.toString()) {
                    this.eventType = EventType.MOVE
                }
            })
        }.width(100.percent)
    }

    private func getTextLayout(): Array<TextInfo> {
        var textLayout: Array<TextInfo>
        if (this.model.textDirection == 0) {
            textLayout = this.stringToArray(this.model.text)
        } else {
            let temp = this.stringToArray(this.model.text)
            temp.reverse()
            textLayout = temp
        }
        return textLayout
    }

    /**
     * 获取文本背景色
     */
    private func getTextLayoutBgColor(): Color {
        return if (this.model.isEnablePressState) {
            Color(this.model.textPressStateStyle)
        } else {
            this.model.bgColor
        }
    }

    /**
     * 获取最小宽度，以及最小字符宽度
     */
    private func getMinWidthEms(): Float64 {
        if (this.model.minEms == 0) {
            if (this.model.minWidth.value == 0.0) {
                return (0.0)
            } else {
                return this.model.minWidth.value
            }
        } else {
            let temp = if (this.model.shouldInclude) {
                this.model.leftIndents + this.model.rightIndents
            } else {
                28.0
            }
            let fontSize: Float64 = if (let Some(size) <- (px2vp(fp2px(this.model.size.fp) ?? this.model.size.fp))) {
                size.value
            } else {
                this.model.size
            }
            let res = Float64((fontSize + this.model.letterSpacing) * Float64(this.model.minEms) + temp)
            return res
        }
    }

    /**
     * 获取最大宽度，以及最大字符宽度
     */
    private func getMaxWidthEms(): Float64 {
        if (this.model.maxEms == 0) {
            if (this.model.maxWidth.value == 0.0) {
                return (Float64.Inf)
            } else {
                return this.model.maxWidth.value
            }
        } else {
            let temp = if (this.model.shouldInclude) {
                this.model.leftIndents + this.model.rightIndents
            } else {
                28.0
            }

            let fontSize: Float64 = if (let Some(size) <- (px2vp(fp2px(this.model.size.fp) ?? this.model.size.fp))) {
                size.value
            } else {
                this.model.size
            }
            let res = Float64((fontSize + this.model.letterSpacing) * Float64(this.model.maxEms) + temp)
            return res
        }
    }

    /**
     * 字符串根据规则转字符数组
     * 规则：先根据指定特殊字符索引拆分，再根据链接拆分
     */
    private func stringToArray(str: String): Array<TextInfo> {
        // 1、处理纯空字符串
        let regu = "^[ ]+$"
        let re = Regex(regu)
        if (re.matcher(str).find().isSome() && !this.model.shouldLayoutZeroLengthText) {
            return Array<TextInfo>()
        }

        // 2、根据被标记的字符段将内容拆分 string 数组
        let strArray: ArrayList<TextInfo> = this.splitSpecialStr(str)

        // 3、根据链接将 strArray 数组中的每一项拆分 string 数组,最终封装成UI要显示的数据
        let resultArray = this.splitHttpStr(strArray)

        return resultArray
    }

    /**
     * 创建 TextInfo
     *
     * @param str -  内容
     * @param strType - 类型
     * @return TextInfo
     */
    private func creatTextInfo(text: String, textType: String): TextInfo {
        let textInfo = TextInfo()
        textInfo.setText(text)
        textInfo.setTextType(textType)
        return textInfo
    }

    /**
     * 字符串整理
     * 根据特殊标记的字符段进行拆分字符串
     *
     * @param str -字符串
     * @retgurn ArrayList<TextInfo>
     */
    private func splitSpecialStr(str: String): ArrayList<TextInfo> {
        var strTemp: Array<Rune> = str.toRuneArray()
        let strArray: ArrayList<TextInfo> = ArrayList<TextInfo>()
        // 提取特殊字符，封装成数组
        if (this.model.specialTextInfoArray.size > 0) {
            var endTemp: Int64 = 0
            for (i in 0..this.model.specialTextInfoArray.size) {
                let textRichText: TextInfo = this.model.specialTextInfoArray[i]
                var start: Int64 = textRichText.start // 特殊处理开始位置
                var end: Int64 = textRichText.end // 特殊处理结束位置
                if(start > end) {
                    start = 0
                    end = 0
                    Hilog.error(0x000000, "Numerical anomaly", "The starting position cannot be greater than the ending position")
                }
                let first: Array<Rune> = strTemp[0..(start - endTemp)]
                let second: Array<Rune> = strTemp[(start - endTemp)..(end - endTemp)]
                strTemp = strTemp[(end - endTemp)..strTemp.size]

                endTemp = end

                let textNormal1 = this.creatTextInfo(String(first), TEXT_TYPE_NORMAL)
                textRichText.setTextType(TEXT_TYPE_RICH)
                textRichText.setText(String(second))

                strArray.append(textNormal1)
                strArray.append(textRichText)
            }
            let textNormal2 = this.creatTextInfo(String(strTemp), TEXT_TYPE_NORMAL)
            strArray.append(textNormal2)
        } else {
            let textAllNormal = this.creatTextInfo(str, TEXT_TYPE_NORMAL)
            strArray.append(textAllNormal)
        }
        return strArray
    }

    /**
     * 字符串整理
     * 根据 url 进行拆分字符串
     *
     * @param strArray - 富文本数组
     * @return Array<TextInfo>
     */
    private func splitHttpStr(strArray: ArrayList<TextInfo>): Array<TextInfo> {
        // url 正则
        let reg: Regex = Regex("(https?|ftp|file):\\/\\/[-A-Za-z0-9+&@#/%?=~_|!:,.]+[-A-Za-z0-9+&@#/%=~_|]")
        let bytes = ArrayList<TextInfo>()
        var index: Option<Int64> = None
        var tempStr: String = ""

        // 外循环是处理过特殊字符的数组
        for (j in 0..strArray.size) {
            // 特殊处理的字符段  打上标记 0x001,UI 显示时只要开头带有0x001说明需要特殊处理
            if (strArray[j].getTextType() == TEXT_TYPE_RICH) {
                bytes.append(strArray[j])
                continue
            }
            index = strArray[j].getText().indexOf(TEXT_TYPE_HTTP)
            // 提取字符串中的链接，封装进数组里
            if (index.isSome()) {
                var urls: Array<String> = []
                var matchText: ?Array<MatchData> = reg.matcher(strArray[j].getText()).findAll()
                if (let Some(text) <- matchText) {
                    urls = Array<String>(text.size, item: "")
                    for (i in 0..text.size) {
                        urls[i] = text[i].matchStr()
                    }
                } else {
                    return []
                }

                // 内循环是处理链接相关
                for (i in 0..urls.size) {
                    index = strArray[j].getText().indexOf(TEXT_TYPE_HTTP)
                    if (let Some(idx) <- index) {
                        tempStr = strArray[j].getText()[0..idx]
                        let textNormal = this.creatTextInfo(tempStr, TEXT_TYPE_NORMAL)
                        bytes.append(textNormal)

                        let textHttp = this.creatTextInfo((urls[i]), TEXT_TYPE_HTTP)
                        bytes.append(textHttp)
                        strArray[j].setText(strArray[j].getText()[(idx + (urls[i]).size)..(strArray[j].getText().size)])
                    }
                }
                let textEndNor = this.creatTextInfo(strArray[j].getText(), TEXT_TYPE_NORMAL)
                bytes.append(textEndNor)
            } else {
                bytes.append(strArray[j])
            }
        }
        return bytes.toArray()
    }

    /**
     * 字符串反转  主要用作当布局设置为反转排列时操作链接跟随反转
     *
     * @param str - 字符串
     * @return String - 反转后字符串
     */
    private func stringReverse(str: String): String {
        var resultTemp: Array<Rune> = str.toRuneArray()
        resultTemp.reverse()
        return String(resultTemp)
    }
}
public enum EventType {
    | DOWN
    | UP
    | MOVE
    | NONE

    public func toNum(): Int32 {
        match (this) {
            case DOWN => 0
            case UP => 1
            case MOVE => 2
            case NONE => -1
        }
    }
}