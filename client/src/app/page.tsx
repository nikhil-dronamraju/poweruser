"use client"

import LoginForm from "@/components/LoginForm";
import Image from "next/image";

export default function Page() {
    return (
        <>
            <span className={"flex items-center"}>
                <Image src={"/poweruser_logo.svg"} alt={"Logo"} width={"40"} height={"40"} />
                <span className={"mx-2 text-3xl"}>Poweruser</span>
            </span>
            <LoginForm />
        </>
    )
}
