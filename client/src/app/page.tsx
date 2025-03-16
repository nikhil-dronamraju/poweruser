"use client"

import LoginForm from "@/components/LoginForm";
import Image from "next/image";
import { mulish } from "@/lib/fonts";

export default function Page() {
    return (
        <>
            <span className={"flex items-center"}>
                <Image src={"/poweruser_logo.svg"} alt={"Logo"} width={"40"} height={"40"} />
                <span className={`mx-2 text-4xl ${ mulish.className } font-bold`}>Poweruser</span>
            </span>
            <LoginForm />
        </>
    )
}
