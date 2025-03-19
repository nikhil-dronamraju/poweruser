"use client"
import {Button} from "@/components/ui/button";
import axios from "axios";
function sendRequestCustom() {
    const postUrl = `${process.env.NEXT_PUBLIC_RAILS_URL}/auth/sign_user_up`
    axios.post(postUrl, {
        "user": {
            first_name: "JeBron Lames"
        }
    }).then((res) => {
        console.log("Testing");
    })
}
export default function Page() {
    return (
        <div>
            Dashboard page.
            <Button variant={"link"} onClick={sendRequestCustom}>Send authenticated request</Button>
        </div>
    )
}