import {Form, FormControl, FormDescription, FormField, FormItem, FormLabel, FormMessage} from "@/components/ui/form";
import {Input} from "@/components/ui/input";
import {Button} from "@/components/ui/button";
import {z} from "zod";
import {useForm} from "react-hook-form";
import {zodResolver} from "@hookform/resolvers/zod";
import axios from "axios";
import {usePathname, useRouter} from "next/navigation";


const formSchema = z.object({
    username: z.string().min(6, {
        message: "Username must be at least 6 characters.",
    }),
    firstName: z.string().min(1, {
        message: "First name can't be blank.",
    }),
    email: z.string().email({
        message: "Invalid email address.",
    }),
    password: z.string().min(6, {
        message: "Password must be at least 6 characters.",
    })
});

export default function LoginForm() {
    const pathName = usePathname()
    const router = useRouter()

    const form = useForm<z.infer<typeof formSchema>>({
        resolver: zodResolver(formSchema),
        defaultValues: {
            username: "",
            firstName: "",
            email: "",
            password: "",
        },
    });

    function onSubmit(values: z.infer<typeof formSchema>) {
        const postUrl = pathName === '/' ? `${process.env.NEXT_PUBLIC_RAILS_URL}/auth/log_user_in` : `${process.env.NEXT_PUBLIC_RAILS_URL}/auth/sign_user_up`
        axios.post(postUrl, {
            "user": {
                first_name: values.firstName,
                username: values.username,
                password: values.password,
                email: values.email
            }
        })
        .then(function (response) {
            console.log(response);
            if (response.data.success) {
                console.log("Shit's working, baby.")
                router.push("/dashboard")
            } else {
                console.log("Bro, what the fuck.");
            }
        })
        .catch(function (error) {
            console.log(error);
        });
    }

    return (
        <Form {...form}>
            <h1 className={"text-4xl mb-8"}>{pathName === '/' ? "Log in" : "Sign up"}</h1>
            <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-4">
                <FormField
                    control={form.control}
                    name="firstName"
                    render={({ field }) => (
                        <FormItem>
                            <FormLabel>First name</FormLabel>
                            <FormControl>
                                <Input placeholder="John Doe" {...field} />
                            </FormControl>
                            <FormMessage />
                        </FormItem>
                    )}
                />
                <FormField
                    control={form.control}
                    name="email"
                    render={({ field }) => (
                        <FormItem>
                            <FormLabel>Email</FormLabel>
                            <FormControl>
                                <Input placeholder="john.doe@email.com" {...field} />
                            </FormControl>
                            <FormMessage />
                        </FormItem>
                    )}
                />
                <FormField
                    control={form.control}
                    name="username"
                    render={({ field }) => (
                        <FormItem>
                            <FormLabel>Username</FormLabel>
                            <FormControl>
                                <Input placeholder="Username" {...field} />
                            </FormControl>
                            <FormDescription>
                                6 characters, alphanumeric.
                            </FormDescription>
                            <FormMessage />
                        </FormItem>
                    )}
                />
                <FormField
                    control={form.control}
                    name="password"
                    render={({ field }) => (
                        <FormItem>
                            <FormLabel>Password</FormLabel>
                            <FormControl>
                                <Input autoComplete={"current-password"} type={"password"} placeholder={"Password"} {...field} />
                            </FormControl>
                            <FormDescription>
                                6 characters, alphanumeric.
                            </FormDescription>
                            <FormMessage />
                        </FormItem>
                    )}
                />
                <Button type="submit">Submit</Button>
            </form>
        </Form>
    )
}