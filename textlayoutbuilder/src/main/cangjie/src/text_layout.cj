/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */
package textlayoutbuilder

import ohos.component.*
import ohos.base.*
import std.collection.{ArrayList}
import std.ast.*
import std.math.*

public class Layout {
    var text: String = ""
    var specialTextInfoArray: ArrayList<TextInfo>
    var specialTextInfo: TextInfo = TextInfo()
    var textColor: UInt32 = 0x000000
    var bgColor: Color = Color(255, 255, 255, alpha: 0.0)
    var width: ?Length = Option<Length>.None
    var minWidth: Length = 0.vp
    var maxWidth: Length = 0.vp
    var size: Float64 = 12.0
    var linkColor: UInt32 = 0x0037ff
    var isEnablePressState: Bool = false
    var textPressStateStyle: UInt32 = 0x999999
    var spacingExtra: Int32 = 0
    var letterSpacing: Float64 = 0.0
    var minEms: Int64 = 0
    var maxEms: Int64 = 0
    var leftIndents: Float64 = 0.0
    var rightIndents: Float64 = 0.0
    var shouldInclude: Bool = false
    var textalign: TextAlign = TextAlign.Start
    var textDirection: Int32 = 0 // 0 默认正常排列自左向右，1 反向排列
    var style: FontStyle = FontStyle.Normal
    var typeface: String = "Arial"
    var ellipsize: TextOverflow = TextOverflow.None
    var singleLine: Bool = false
    var status: Bool = true
    var maxLines: Int32 = 0
    var shouldLayoutZeroLengthText: Bool = true
    var clickCallback: (textInfo: TextInfo) -> Unit = {textInfo =>}

    public init() {
        this.specialTextInfoArray = ArrayList<TextInfo>()
    }

    public func setSpecialTextClick(clickCallback: (textInfo: TextInfo) -> Unit): Layout {
        this.clickCallback = clickCallback
        return this
    }

    public func setWidth(width: Length): Layout {
        this.width = width
        return this
    }

    public func setMinWidth(minWidth: Length): Layout {
        this.minWidth = minWidth
        return this
    }

    public func getMinWidth(): Length {
        return this.minWidth
    }

    public func setMaxWidth(maxWidth: Length): Layout {
        this.maxWidth = maxWidth
        return this
    }

    public func getMaxWidth(): Length {
        return this.maxWidth
    }

    public func setText(text: String): Layout {
        if (this.text != text) {
            this.text = text
        }
        return this
    }

    public func getText(): String {
        return this.text
    }

    public func setSpecialTextInfo(specialTextInfo: TextInfo): Layout {
        if (refEq(this.specialTextInfo, specialTextInfo) == false) {
            this.specialTextInfo = specialTextInfo
            this.specialTextInfoArray.append(this.specialTextInfo)
        }
        return this
    }

    public func setTextSize(size: Float64): Layout {
        if (size < 0.0) {
            this.size = 12.0
        }
        return this
    }

    public func getTextSize(): Float64 {
        return this.size
    }

    public func setTextColor(textColor: UInt32): Layout {
        if (this.textColor != textColor) {
            this.textColor = textColor
        }
        return this
    }

    public func setBgColor(bgColor: Color): Layout {
        if (this.bgColor.toUInt32() != bgColor.toUInt32()) {
            this.bgColor = bgColor
        }
        return this
    }

    public func getTextColor(): UInt32 {
        return this.textColor
    }

    public func setLinkColor(linkColor: UInt32): Layout {
        if (this.linkColor != linkColor) {
            this.linkColor = linkColor
        }
        return this
    }

    public func getLinkColor(): UInt32 {
        return this.linkColor
    }

    public func setIsEnablePressState(isEnablePressState: Bool): Layout {
        if (this.isEnablePressState != isEnablePressState) {
            this.isEnablePressState = isEnablePressState
        }
        return this
    }

    public func setTextPressStateStyle(textPressStateStyle: UInt32): Layout {
        if (this.textPressStateStyle != textPressStateStyle) {
            this.textPressStateStyle = textPressStateStyle
        }
        return this
    }

    public func getTextPressStateStyle(): UInt32 {
        return this.textPressStateStyle
    }

    public func setUseLineSpacingFromFallbacks(status: Bool): Layout {
        if (this.status != status) {
            this.status = status
        }
        return this
    }

    public func getUseLineSpacingFromFallbacks(): Bool {
        return this.status
    }

    public func setLetterSpacing(letterSpacing: Float64): Layout {
       if(letterSpacing < 0.0) {
            this.letterSpacing = 0.0
       } else {
           this.letterSpacing = letterSpacing
       }

        return this
    }

    public func getLetterSpacing(): Float64 {
        return this.letterSpacing
    }

    public func setMinEms(minEms: Int64): Layout {
        this.minEms = abs(minEms)
        return this
    }

    public func getMinEms(): Int64 {
        return this.minEms
    }

    public func setMaxEms(maxEms: Int64): Layout {
        this.maxEms = abs(maxEms)
        return this
    }

    public func getMaxEms(): Int64 {
        return this.maxEms
    }

    public func setIncludeFontPadding(shouldInclude: Bool): Layout {
        if (this.shouldInclude != shouldInclude) {
            this.shouldInclude = shouldInclude
        }
        return this
    }

    public func getIncludeFontPadding(): Bool {
        return this.shouldInclude
    }

    public func setAlignment(textalign: TextAlign): Layout {
        this.textalign = textalign

        return this
    }

    public func getAlignment(): TextAlign {
        return this.textalign
    }

    public func setIndents(leftIndents: Float64, rightIndents: Float64): Layout {
        if (leftIndents < 0.0) {
            this.leftIndents = 0.0
        } else {
            this.leftIndents = leftIndents
        }
        if (rightIndents < 0.0) {
            this.rightIndents = 0.0
        } else {
            this.rightIndents = rightIndents
        }
        return this
    }

    public func getLeftIndents(): Float64 {
        return this.rightIndents
    }

    public func getRightIndents(): Float64 {
        return this.leftIndents
    }

    public func setTextDirection(textDirection: Int32): Layout {
        match (textDirection) {
        	case 1 => this.textDirection = 1
            case _ => this.textDirection = 0
        }
        return this
    }

    public func getTextDirection(): Int32 {
        return this.textDirection
    }

    public func setTextStyle(style: FontStyle): Layout {
        this.style = style

        return this
    }

    public func setTypeface(typeface: String): Layout {
        if (this.typeface != typeface) {
            this.typeface = typeface
        }
        return this
    }

    public func getTypeface(): String {
        return this.typeface
    }

    public func setEllipsize(ellipsize: TextOverflow): Layout {
        this.ellipsize = ellipsize

        return this
    }

    public func getEllipsize(): TextOverflow {
        return this.ellipsize
    }

    public func setSingleLine(singleLine: Bool): Layout {
        if (this.singleLine != singleLine) {
            this.singleLine = singleLine
        }
        return this
    }

    public func getSingleLine(): Bool {
        return this.singleLine
    }

    public func setMaxLines(maxLines: Int32): Layout {
        if (this.maxLines < 0) {
            this.maxLines = 0
        } else {
            this.maxLines = maxLines
        }
        return this
    }

    public func getMaxLines(): Int32 {
        return this.maxLines
    }

    public func setShouldLayoutZeroLengthText(shouldLayoutZeroLengthText: Bool) {
        if (this.shouldLayoutZeroLengthText != shouldLayoutZeroLengthText) {
            this.shouldLayoutZeroLengthText = shouldLayoutZeroLengthText
        }
        return this
    }
}
