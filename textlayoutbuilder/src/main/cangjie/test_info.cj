/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */
package textlayoutbuilder

import ohos.component.*

public class TextInfo {
    var start: Int64 = 0
    var end: Int64 = 0
    var text: String = ""
    var textType: String = ""
    var fontSize: Int64 = 0
    var fontColor: UInt32 = 0x000000
    var fontLetterSpacing: Int64 = 0
    var fontStyle: FontStyle = FontStyle.Normal

    public func setStart(start: Int64): Unit {
        if(start < 0) {
            this.start = 0
        } else {
            this.start = start
        }
    }

    public func getStart(): Int64 {
        return this.start
    }

    public func setEnd(end: Int64): Unit {
        if(end < 0) {
            this.end = 0
        } else {
            this.end = end
        }

    }

    public func getEnd(): Int64 {
        return this.end
    }

    public func setText(text: String): Unit {
        this.text = text
    }

    public func getText(): String {
        return this.text
    }

    public func setTextType(textType: String): Unit {
        this.textType = textType
    }

    public func getTextType(): String {
        return this.textType
    }

    public func setFontSize(fontSize: Int64): Unit {
        this.fontSize = fontSize
    }

    public func getFontSize(): Int64 {
        return this.fontSize
    }

    public func setFontColor(fontColor: UInt32): Unit {
        this.fontColor = fontColor
    }

    public func getFontColor(): UInt32 {
        return this.fontColor
    }

    public func setFontLetterSpacing(fontLetterSpacing: Int64): Unit {
        if(fontLetterSpacing < 0) {
            this.fontLetterSpacing = 0
        } else {
            this.fontLetterSpacing = fontLetterSpacing
        }

    }

    public func getFontLetterSpacing(): Int64 {
        return this.fontLetterSpacing
    }

    public func setFontStyle(fontStyle: FontStyle): Unit {
        this.fontStyle = fontStyle
    }

    public func getFontStyle(): FontStyle {
        return this.fontStyle
    }
}
