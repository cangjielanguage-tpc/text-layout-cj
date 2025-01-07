# text-layout-cj 特性文档

## 介绍

text-layout-cj 是一个可定制多种样式的文本构建工具，包括字体间距、大小、颜色、布局方式、富文本高亮显示等，在文字显示的业务场景中都会使用到，特别是通知类特殊显示的字体样式时，text-layout-cj 极大的提升了开发效率。

## 1 富文本数据实体

### 1.1 TextInfo Component API Description

```cangjie
public class TextInfo {
    /*
     * 富文本数据实体初始化。
     */
    public init()
    /*
     * 设置特殊文字开始位置，默认 0。
     * 
     * 参数 start - 开始位置
     * 返回值 Unit
     */
    public func setStart(start: Int64): Unit
    
    /*
     * 设置特殊文字结束位置，默认 0。
     * 
     * 参数 start - 结束位置
     * 返回值 Unit
     */
    public func setEnd(end: Int64): Unit
    
    /*
     * 设置字体大小，默认 12。
     * 
     * 参数 fontSize - 字体大小
     * 返回值 Unit
     */
    public func setFontSize(fontSize: Int64): Unit
    
    /*
     * 设置文字颜色，默认 0x000000。
     * 
     * 参数 fontColor - 文字颜色
     * 返回值 Unit
     */
    public func setFontColor(fontColor: UInt32): Unit
    
    /*
     * 设置文本字体之间的距离，默认 0。
     * 
     * 参数 fontLetterSpacing - 文本字体之间的距离
     * 返回值 Unit
     */
    public func setFontLetterSpacing(fontLetterSpacing: Int64): Unit
    
    /*
     * 设置字体样式，默认 FontStyle.Normal。
     * 
     * 参数 fontStyle - 字体样式
     * 返回值 Unit
     */
    public func setFontStyle(fontStyle: FontStyle): Unit
    
    /*
     * 获取特殊文字开始位置。
     *
     * 返回值 Int64 - 文字开始位置
     */
    public func getStart(): Int64
    
    /*
     * 获取特殊文字结束位置。
     *
     * 返回值 Int64 - 文字结束位置
     */
    public func getEnd(): Int64
    
    /*
     * 获取文字内容。
     *
     * 返回值 String - 文字内容
     */
    public func getText(): String
    
    /*
     * 获取文字类型。
     *
     * 返回值 String - 文字类型
     */
    public func getTextType(): String
    
    /*
     * 获取字体大小。
     *
     * 返回值 Int64 - 字体大小
     */
    public func getFontSize(): Int64
    
    /*
     * 获取文字颜色。
     *
     * 返回值 UInt32 - 文字颜色
     */
    public func getFontColor(): UInt32
    
    /*
     * 获取文本字体之间的距离。
     *
     * 返回值 Int64 - 文本字体之间的距离
     */
    public func getFontLetterSpacing(): Int64
    
    /*
     * 获取字体样式。
     *
     * 返回值 FontStyle - 字体样式
     */
    public func getFontStyle(): FontStyle
}
```

## 2 文本布局

### 1.1 Layout Component API Description

- 建议 setMinWidth、setMaxWidth 和 setWidth 不同时使用

```cangjie
public class Layout {
    /*
     * 文本布局初始化。
     */
    public init()
    
    /*
     * 设置按下文字时的状态样式。
     *
     * 参数 clickCallback - 用户自定义回调函数
     * 返回值 Layout - 文本布局
     */
    public func setSpecialTextClick(clickCallback: (textInfo: TextInfo) -> Unit): Layout
    
    /*
     * 设置文本布局宽度。
     *
     * 参数 width - 文本布局宽度，单位 Length，默认 100.percent
     * 返回值 Layout - 文本布局
     */
    public func setWidth(width: Length): Layout
    
    /*
     * 设置文本布局最小宽度。
     *
     * 参数 minWidth - 文本布局最小宽度，默认 0.vp 
     * 返回值 Layout - 文本布局
     */
    public func setMinWidth(minWidth: Length): Layout
    
    /*
     * 设置文本布局最大宽度。
     *
     * 参数 maxWidth - 文本布局最大宽度，默认 0.vp 
     * 返回值 Layout - 文本布局
     */
    public func setMaxWidth(maxWidth: Length): Layout
    
    /*
     * 设置文本内容。
     *
     * 参数 text - 文本内容，默认空 
     * 返回值 Layout - 文本布局
     */
    public func setText(text: String): Layout
    
    /*
     * 设置指定文字内容样式。
     *
     * 参数 specialTextInfo - 文本内容样式
     * 返回值 Layout - 文本布局
     */
    public func setSpecialTextInfo(specialTextInfo: TextInfo): Layout
    
    /*
     * 设置文本字体大小，默认 12.0。
     *
     * 参数 size - 文本字体大小
     * 返回值 Layout - 文本布局
     */
    public func setTextSize(size: Float64): Layout
    
    /*
     * 设置文本字体颜色。
     *
     * 参数 textColor - 文本字体颜色，默认 0x000000。
     * 返回值 Layout - 文本布局
     */
    public func setTextColor(textColor: UInt32): Layout
    
    /*
     * 设置文本布局背景颜色。
     *
     * 参数 bgColor - 文本布局背景颜色，默认白色。
     * 返回值 Layout - 文本布局
     */
    public func setBgColor(bgColor: Color): Layout
    
    /*
     * 设置链接字体颜色。
     *
     * 参数 linkColor - 链接字体颜色，默认 0x0037ff。
     * 返回值 Layout - 文本布局
     */
    public func setLinkColor(linkColor: UInt32): Layout
    
    /*
     * 是否设置组件按下时颜色变化。
     *
     * 参数 isEnablePressState - 默认 false。
     * 返回值 Layout - 文本布局
     */
    public func setIsEnablePressState(isEnablePressState: Bool): Layout
    
    /*
     * 设置按下时组件颜色。
     *
     * 参数 textPressStateStyle - 按下文字状态样式，默认 0x999999。
     * 返回值 Layout - 文本布局
     */
    public func setTextPressStateStyle(textPressStateStyle: UInt32): Layout
    
    /*
     * 设置文字间距。
     *
     * 参数 letterSpacing - 文字间距，默认 0.0。
     * 返回值 Layout - 文本布局
     */
    public func setLetterSpacing(letterSpacing: Float64): Layout
    
    /*
     * 设置每行最小显示字数。
     *
     * 参数 minEms - 最小显示字数，默认 0，负数取绝对值。
     * 返回值 Layout - 文本布局
     */
    public func setMinEms(minEms: Int64): Layout
    
    /*
     * 设置每行最大显示字数。
     *
     * 参数 maxEms - 最大显示字数，默认 0 字符占据文本布局宽度，负数取绝对值。
     * 返回值 Layout - 文本布局
     */
    public func setMaxEms(maxEms: Int64): Layout
    
    /*
     * 设置组件是否设置内边距。
     *
     * 参数 shouldInclude - 是否设置内边距，默认 false。
     * 返回值 Layout - 文本布局
     */
    public func setIncludeFontPadding(shouldInclude: Bool): Layout
    
    /*
     * 设置文本对齐方式。
     *
     * 参数 textalign - 文本对齐方式，默认 TextAlign.Start。
     * 返回值 Layout - 文本布局
     */
    public func setAlignment(textalign: TextAlign): Layout
    
    /*
     * 设置组件左右内边距。
     *
     * 参数 leftIndents - 左边距，默认 0.0。
     * 参数 rightIndents - 右边距，默认 0.0。
     * 返回值 Layout - 文本布局
     */
    public func setIndents(leftIndents: Float64, rightIndents: Float64): Layout
    
    /*
     * 设置文字排列方向。
     *
     * 参数 textDirection - 1 反向排列，其他值正向排列。
     * 返回值 Layout - 文本布局
     */
    public func setTextDirection(textDirection: Int32): Layout
    
    /*
     * 设置字体样式。
     *
     * 参数 style - 默认 FontStyle.Normal。
     * 返回值 Layout - 文本布局
     */
    public func setTextStyle(style: FontStyle): Layout
    
    /*
     * 设置字体。
     *
     * 参数 typeface - 默认 Arial，范围参考 cangjieUI API 文本通用的 fontFamily 函数。
     * 返回值 Layout - 文本布局
     */
    public func setTypeface(typeface: String): Layout
    
    /*
     * 设置文本显示不下时的省略号替代方式，需要和 setMaxLines 组合生效。
     *
     * 参数 ellipsize - 默认 TextOverflow.None。
     * 返回值 Layout - 文本布局
     */
    public func setEllipsize(ellipsize: TextOverflow): Layout

    /*
     * 设置是否单行显示。
     *
     * 参数 singleLine - 默认 false
     * 返回值 Layout - 文本布局
     */
    public func setSingleLine(singleLine: Bool): Layout
    
    /*
     * 设置最大行数。
     *
     * 参数 maxLines - 默认 0，显示最大行数。
     * 返回值 Layout - 文本布局
     */
    public func setMaxLines(maxLines: Int32): Layout
    
    /*
     * 获取文本布局最小宽度。
     *
     * 返回值 Length - 最小宽度
     */
    public func getMinWidth(): Length
    
    /*
     * 获取文本布局最大宽度
     *
     * 返回值 Length - 文本布局最大宽度
     */
    public func getMaxWidth(): Length
    
    /*
     * 获取文本内容
     *
     * 返回值 String - 文本内容
     */
    public func getText(): String
    
    /*
     * 获取文本内容字体大小
     *
     * 返回值 Float64 - 文本内容字体大小
     */
    public func getTextSize(): Float64
    
    /*
     * 获取文本内容字体颜色。
     *
     * 返回值 UInt32 - 文本内容字体颜色
     */
    public func getTextColor(): UInt32
    
    /*
     * 获取链接字体颜色。
     *
     * 返回值 UInt32 - 链接字体颜色
     */
    public func getLinkColor(): UInt32
    
    /*
     * 获取文本按下时颜色
     *
     * 返回值 UInt32 - 颜色
     */
    public func getTextPressStateStyle(): UInt32
    
    /*
     * 获取文字间距。
     *
     * 返回值 Float64 - 文字间距
     */
    public func getLetterSpacing(): Float64
    
    /*
     * 获取每行最小显示字数。
     *
     * 返回值 Int64 - 最小显示字数
     */
    public func getMinEms(): Int64
    
    /*
     * 获取每行最大显示字数。
     *
     * 返回值 Int64 - 最大显示字数
     */
    public func getMaxEms(): Int64
    
    /*
     * 获取组件是否设置内边距。
     *
     * 返回值 Bool - 是否设置内边距
     */
    public func getIncludeFontPadding(): Bool
    
    /*
     * 获取文本对齐方式。
     *
     * 返回值 TextAlign - 文本对齐方式
     */
    public func getAlignment(): TextAlign
    
    /*
     * 获取左内边距。
     *
     * 返回值 Float64 - 左内边距
     */
    public func getLeftIndents(): Float64
    
    /*
     * 获取右内边距。
     *
     * 返回值 Float64 - 右内边距
     */
    public func getRightIndents(): Float64
    
    /*
     * 获取文字排列方向。
     *
     * 返回值 Int32 - 文字排列方向（0/1）
     */
    public func getTextDirection(): Int32
    
    /*
     * 获取字体。
     *
     * 返回值 String - 字体
     */
    public func getTypeface(): String
    
    /*
     * 获取文本显示不下时的省略号替代方式。
     *
     * 返回值 TextOverflow - 文本显示不下时的省略号替代方式
     */
    public func getEllipsize(): TextOverflow
    
    /*
     * 获取是否单行显示。
     *
     * 返回值 Bool - 是否单行显示
     */
    public func getSingleLine(): Bool
    
    /*
     * 获取最大行数。
     *
     * 返回值 Int32 - 最大行数
     */
    public func getMaxLines(): Int32
}

```

## 3 文本布局自定义组件

### 1.1 TextLayout Component API Description

```cangjie
@Component
public class TextLayout {
    @State
    var model: Layout = Layout()
}
```
## 4 示例

```cangjie
import ohos.state_macro_manage.Entry
import ohos.state_macro_manage.Component
import ohos.state_macro_manage.State
import ohos.state_macro_manage.r
import ohos.base.*
import ohos.component.*
import ohos.state_manage.*
import ohos.state_macro_manage.*
import ohos.component.Scroller
import ohos.component.Scroll
import textlayoutbuilder.*

@Entry
@Component
class EntryView {
    var scroller: Scroller = Scroller()
    private var strTest = "我想问，123456，你知道是如何生成的吗？https://xxxxx.xxxxxx.com/这是有道翻译的链接，如何你告诉我答案全部正确的话我将录用你为有道翻译的小小程序猿，https://xxxxx.xxxxxx.com/程序的架构你还拿不，大禹的板子屏幕很大，凑个字数。如何你告诉我答案全部正确的话我将录用你为有道翻译的小小程序猿."
    var data1: Layout = Layout()
    var data2: Layout = Layout()
    var data3: Layout = Layout()
    var data4: Layout = Layout()
    var data5: Layout = Layout()
    var data6: Layout = Layout()
    var data7: Layout = Layout()
    var data8: Layout = Layout()
    var data9: Layout = Layout()
    var data10: Layout = Layout()
    var data11: Layout = Layout()
    var data12: Layout = Layout()
    var data13: Layout = Layout()
    var data14: Layout = Layout()
    var data15: Layout = Layout()

    func build() {
        Scroll(this.scroller) {
            Column() {
                Text("默认显示").fontSize(16).fontColor(0x999999).textAlign(TextAlign.Start).margin(left: 14,
                    top: 14, bottom: 14)
                Column() {
                    TextLayout(model: this.data1)
                }.backgroundColor(0xcccccc).margin(left: 14, right: 14).borderRadius(10)

                Text("单行显示，文字颜色紫色").fontSize(16).fontColor(0x999999).margin(left: 14, top: 14,
                    bottom: 14)
                Column() {
                    TextLayout(model: this.data2)
                }.backgroundColor(0xcccccc).margin(left: 14, right: 14).borderRadius(10)

                Text("最大 2 行显示，结尾省略号，带内边距").fontSize(16).fontColor(0x999999).margin(
                    left: 14, top: 14, bottom: 14)
                Column() {
                    TextLayout(model: this.data3)
                }.backgroundColor(0xcccccc).margin(left: 14, right: 14).borderRadius(10)

                Text("链接颜色红色，文字间距").fontSize(16).fontColor(0X999999).margin(left: 14, top: 14,
                    bottom: 14)
                Column() {
                    TextLayout(model: this.data4)
                }.backgroundColor(0Xcccccc).margin(left: 14, right: 14).borderRadius(10)

                Text("文字反向排列").fontSize(16).fontColor(0X999999).margin(left: 14, top: 14, bottom: 14)
                Column() {
                    TextLayout(model: this.data5)
                }.backgroundColor(0Xcccccc).margin(left: 14, right: 14).borderRadius(10)

                Text("文字靠右对齐").fontSize(16).fontColor(0x999999).margin(left: 14, top: 14, bottom: 14)
                Column() {
                    TextLayout(model: this.data6)
                }.backgroundColor(0xcccccc).margin(left: 14, right: 14).borderRadius(10)

                Text("文本最大宽度").fontSize(16).fontColor(0x999999).margin(left: 14, top: 14, bottom: 14)
                Column() {
                    TextLayout(model: this.data7)
                }.backgroundColor(0xcccccc).margin(left: 14, right: 14).borderRadius(10)

                Text("文本点击状态").fontSize(16).fontColor(0x999999).margin(left: 14, top: 14, bottom: 14)
                Column() {
                    TextLayout(model: this.data8)
                }.backgroundColor(0xcccccc).margin(left: 14, right: 14).borderRadius(10)

                Text("标记指定文本特殊显示").fontSize(16).fontColor(0x999999).margin(left: 14, top: 14,
                    bottom: 14)
                Column() {
                    TextLayout(model: this.data9)
                }.backgroundColor(0xcccccc).margin(left: 14, right: 14).borderRadius(10)

                Text("标记多处指定文本特殊显示").fontSize(16).fontColor(0x999999).margin(left: 14, top: 14,
                    bottom: 14)
                Column() {
                    TextLayout(model: this.data10)
                }.backgroundColor(0xcccccc).margin(left: 14, right: 14).borderRadius(10)

                Text("显示空字符串,背景色红色占位").fontSize(16).fontColor(0x999999).margin(left: 14,
                    top: 14, bottom: 14)
                Column() {
                    TextLayout(model: this.data11)
                }.backgroundColor(0xcccccc).margin(left: 14, right: 14).borderRadius(10)

                Text("特殊文本点击，数据回调").fontSize(16).fontColor(0x999999).margin(left: 14, top: 14,
                    bottom: 14)
                Column() {
                    TextLayout(model: this.data12)
                }.backgroundColor(0xcccccc).margin(left: 14, right: 14).borderRadius(10)

                Text("每行最大显示五个字符").fontSize(16).fontColor(0x999999).margin(left: 14, top: 14,
                    bottom: 14)
                Column() {
                    TextLayout(model: this.data13)
                }.backgroundColor(0xcccccc).margin(left: 14, right: 14).borderRadius(10)

                Text("每行最小显示五个字符").fontSize(16).fontColor(0x999999).margin(left: 14, top: 14,
                    bottom: 14)
                Column() {
                    TextLayout(model: this.data14)
                }.backgroundColor(0xcccccc).margin(left: 14, right: 14).borderRadius(10)

                Text("左缩进").fontSize(16).fontColor(0x999999).margin(left: 14, top: 14, bottom: 14)
                Column() {
                    TextLayout(model: this.data15)
                }.backgroundColor(0xcccccc).margin(left: 14, right: 14).borderRadius(10)

                Column() {}.height(200)
            }
        }
    }
    protected override func aboutToAppear(): Unit {
        let textInfo1 = TextInfo()
        textInfo1.setStart(2)
        textInfo1.setEnd(8)
        textInfo1.setFontSize(16)
        textInfo1.setFontColor(0x00ff00)
        textInfo1.setFontLetterSpacing(6)
        textInfo1.setFontStyle(FontStyle.Italic)

        let textInfo2 = TextInfo()
        textInfo2.setStart(11)
        textInfo2.setEnd(15)
        textInfo2.setFontSize(18)
        textInfo2.setFontColor(0xff0000)
        textInfo2.setFontLetterSpacing(8)

        let textInfo3 = TextInfo()
        textInfo3.setStart(50)
        textInfo3.setEnd(53)
        textInfo3.setFontSize(20)
        textInfo3.setFontColor(0xffff00)
        textInfo3.setFontLetterSpacing(10)

        this.data1.setText(this.strTest).setTypeface("sans-serif")

        let tempData2: Layout = this.data2
        tempData2.setText(this.strTest).setTextColor(0x800080).setSingleLine(true)
        this.data2 = tempData2

        let tempData3: Layout = this.data3
        tempData3.setText(this.strTest).setSingleLine(false).setMaxLines(2).setEllipsize(TextOverflow.Ellipsis).
            setIncludeFontPadding(true)
        this.data3 = tempData3

        let tempData4: Layout = this.data4
        tempData4.setText(this.strTest).setMaxLines(3).setEllipsize(TextOverflow.Ellipsis).setIncludeFontPadding(true).
            setLinkColor(0Xff0000).setLetterSpacing(6.0)
        this.data4 = tempData4

        let tempData5: Layout = this.data5
        tempData5.setText(this.strTest).setIncludeFontPadding(true).setTextDirection(1)
        this.data5 = tempData5

        let tempData6: Layout = this.data6
        tempData6.setText(this.strTest).setIncludeFontPadding(true).setAlignment(TextAlign.End)
        this.data6 = tempData6

        let tempData7: Layout = this.data7
        tempData7.setText(this.strTest).setMaxWidth(200.vp).setIncludeFontPadding(true)
        this.data7 = tempData7

        let tempData8: Layout = this.data8
        tempData8.setText(this.strTest).setIncludeFontPadding(true).setIsEnablePressState(true).setTextPressStateStyle(
            0x999999)
        this.data8 = tempData8

        let tempData9: Layout = this.data9
        tempData9.setText(this.strTest).setSpecialTextInfo(textInfo1)
        this.data9 = tempData9

        let tempData10: Layout = this.data10
        tempData10.setText(this.strTest).setSpecialTextInfo(textInfo1).setSpecialTextInfo(textInfo2).setSpecialTextInfo(
            textInfo3)
        this.data10 = tempData10

        let tempData11: Layout = this.data11
        tempData11.setText("              ").setBgColor(Color(0xff0000)).setIncludeFontPadding(true)
        this.data11 = tempData11

        let tempData12: Layout = this.data12
        tempData12.setText(this.strTest).setSpecialTextInfo(textInfo1).setSpecialTextInfo(textInfo2).setSpecialTextInfo(
            textInfo3).setSpecialTextClick(
            {
            textInfo => AlertDialog.show(AlertDialogParamWithConfirm("我点击了 = ${textInfo.getText()}"))
        })
        this.data12 = tempData12

        let tempData13: Layout = this.data13
        tempData13.setText(
            "一二三四五六七八九十你我他你我他你我他你我他你我他你我他你我他你我他你我"
        ).setIncludeFontPadding(true).setMaxEms(5)
        this.data13 = tempData13

        let tempData14: Layout = this.data14
        tempData14.setText("一二三").setIncludeFontPadding(true).setBgColor(Color(0xff0000)).setMinEms(5)
        this.data14 = tempData14

        let tempData15: Layout = this.data15
        tempData15.setText(
            "一二三四五六七八九十你我他你我他你我他你我他你我他你我他你我他你我他你我"
        ).setIndents(20.0, 0.0)
        this.data15 = tempData15
    }
}
```
