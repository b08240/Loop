//
//  WindowDirection.swift
//  Loop
//
//  Created by Kai Azim on 2023-06-14.
//

import SwiftUI
import Defaults

// Enum that stores all possible resizing options
enum WindowDirection: CaseIterable {

    case noAction
    case maximize

    // Halves
    case topHalf
    case rightHalf
    case bottomHalf
    case leftHalf

    // Quarters
    case topLeftQuarter
    case topRightQuarter
    case bottomRightQuarter
    case bottomLeftQuarter

    // Horizontal Thirds
    case rightThird
    case rightTwoThirds
    case horizontalCenterThird
    case leftThird
    case leftTwoThirds

    // Vertical Thirds
    case topThird
    case topTwoThirds
    case verticalCenterThird
    case bottomThird
    case bottomTwoThirds

    var nextWindowDirection: WindowDirection {
        switch self {
        case .noAction:             .topHalf
        case .topHalf:              .topRightQuarter
        case .topRightQuarter:      .rightHalf
        case .rightHalf:            .bottomRightQuarter
        case .bottomRightQuarter:   .bottomHalf
        case .bottomHalf:           .bottomLeftQuarter
        case .bottomLeftQuarter:    .leftHalf
        case .leftHalf:             .topLeftQuarter
        case .topLeftQuarter:       .maximize
        case .maximize:             .noAction
        default:                    .noAction
        }
    }

    var halves: [WindowDirection] {
        return [.topHalf, .rightHalf, .bottomHalf, .leftHalf]
    }

    var horizontalThirds: [WindowDirection] {
        return [.leftThird, .leftTwoThirds, .horizontalCenterThird, .rightTwoThirds, .rightThird]
    }

    var verticalThirds: [WindowDirection] {
        return [.topThird, .topTwoThirds, .verticalCenterThird, .bottomTwoThirds, .bottomThird]
    }

    var name: String? {
        switch self {
        case .noAction:                 nil
        case .maximize:                 "Maximize"

        case .topHalf:                  "Top Half"
        case .rightHalf:                "Right Half"
        case .bottomHalf:               "Bottom Half"
        case .leftHalf:                 "Left Half"

        case .topLeftQuarter:           "Top Left Quarter"
        case .topRightQuarter:          "Top Right Quarter"
        case .bottomRightQuarter:       "Bottom Right Quarter"
        case .bottomLeftQuarter:        "Bottom Left Quarter"

        case .leftThird:                "Left Third"
        case .leftTwoThirds:            "Left Two Thirds"
        case .horizontalCenterThird:    "Horizontal Center Third"
        case .rightTwoThirds:           "Right Two Thirds"
        case .rightThird:               "Right Third"

        case .topThird:                  "Top Third"
        case .topTwoThirds:              "Top Two Thirds"
        case .verticalCenterThird:       "Vertical Center Third"
        case .bottomThird:               "Bottom Third"
        case .bottomTwoThirds:           "Bottom Two Thirds"
        }
    }

    var keybind: [Set<UInt16>] {
        switch self {
        case .noAction:                 [[]]
        case .maximize:                 Defaults[.maximizeKeybind]

        case .topHalf:                  Defaults[.topHalfKeybind]
        case .rightHalf:                Defaults[.rightHalfKeybind]
        case .bottomHalf:               Defaults[.bottomHalfKeybind]
        case .leftHalf:                 Defaults[.leftHalfKeybind]

        case .topLeftQuarter:           Defaults[.topLeftQuarter]
        case .topRightQuarter:          Defaults[.topRightQuarter]
        case .bottomRightQuarter:       Defaults[.bottomRightQuarter]
        case .bottomLeftQuarter:        Defaults[.bottomLeftQuarter]

        case .leftThird:                Defaults[.leftThird]
        case .leftTwoThirds:            Defaults[.leftTwoThirds]
        case .horizontalCenterThird:    Defaults[.horizontalCenterThird]
        case .rightTwoThirds:           Defaults[.rightTwoThirds]
        case .rightThird:               Defaults[.rightThird]

        default:                        [[]]
        }
    }

    func setKeybind(_ keybind: [Set<UInt16>]) {
        switch self {
        case .maximize:                 Defaults[.maximizeKeybind] = keybind

        case .topHalf:                  Defaults[.topHalfKeybind] = keybind
        case .rightHalf:                Defaults[.rightHalfKeybind] = keybind
        case .bottomHalf:               Defaults[.bottomHalfKeybind] = keybind
        case .leftHalf:                 Defaults[.leftHalfKeybind] = keybind

        case .topLeftQuarter:           Defaults[.topLeftQuarter] = keybind
        case .topRightQuarter:          Defaults[.topRightQuarter] = keybind
        case .bottomRightQuarter:       Defaults[.bottomRightQuarter] = keybind
        case .bottomLeftQuarter:        Defaults[.bottomLeftQuarter] = keybind

        case .leftThird:                Defaults[.leftThird] = keybind
        case .leftTwoThirds:            Defaults[.leftTwoThirds] = keybind
        case .horizontalCenterThird:    Defaults[.horizontalCenterThird] = keybind
        case .rightTwoThirds:           Defaults[.rightTwoThirds] = keybind
        case .rightThird:               Defaults[.rightThird] = keybind
        default: return
        }
    }
}