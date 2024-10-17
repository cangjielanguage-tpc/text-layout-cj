/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights resvered.
 */
package textLayoutBuilder

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
