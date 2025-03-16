import {Miriam_Libre, Shanti, Mulish } from "next/font/google";

/**
 * Font pairings atm:
 * Mulish (Headers)
 * Miriam libre for smaller headers
 * Shanti for generic
 */

export const mulish = Mulish({
    weight: "variable",
    subsets: ["latin"]
});

export const miriamLibre = Miriam_Libre({
    weight: "variable",
    subsets: ["latin"]
});

export const shanti = Shanti({
    weight: ["400"],
    style: "normal",
    subsets: ["latin"]
})
