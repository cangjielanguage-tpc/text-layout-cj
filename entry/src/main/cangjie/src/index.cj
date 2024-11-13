/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */

package ohos_app_cangjie_entry

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
