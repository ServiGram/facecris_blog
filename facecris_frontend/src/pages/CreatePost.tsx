import { useForm } from "react-hook-form";
import { createPost } from "../api/posts.api";
import { useNavigate } from "react-router-dom";
import { userInfo } from "../api/user.api";
import { useEffect, useState } from "react";

interface User {
    id: number;
}

export function CreatePost() {
    const { register, handleSubmit } = useForm();
    const navigate = useNavigate();
    const [user, setUser] = useState<User | null>(null);
    const [isLoadingUser, setIsLoadingUser] = useState(true);

    useEffect(() => {
        const fetchUserInfo = async () => {
            try {
                const res = await userInfo();
                setUser(res!.data);
            } catch (error) {
                console.error("Error fetching user info:", error);
            } finally {
                setIsLoadingUser(false);
            }
        };

        fetchUserInfo();
    }, []);

    const onSubmit = handleSubmit(async data => {
        if (!user) return;  // Si el usuario es null, no envía el formulario

        const formData = new FormData();

        // Agregar los datos del formulario al FormData
        formData.append("title", data.title);
        formData.append("content", data.content);
        formData.append("author", user.id.toString());

        // Agregar la imagen al FormData si existe
        if (data.image && data.image[0]) {
            formData.append("image", data.image[0]);  // `image` es el nombre del campo en el backend
        }

        // Enviar el FormData
        await createPost(formData);
        navigate("/");
    });

    return (
        <div className="container margin mt-4">
            <form onSubmit={onSubmit}>
                <div className="mb-3">
                    <input
                        type="text"
                        className="form-control"
                        placeholder="Título"
                        {...register("title", { required: true })}
                    />
                </div>
                <div className="mb-3">
                    <textarea
                        className="form-control"
                        rows={3}
                        placeholder="Escribe aquí tu contenido"
                        {...register("content", { required: true })}
                    ></textarea>
                </div>
                <div className="mb-3">
                    <input
                        type="file"
                        className="form-control"
                        {...register("image")}
                    />
                </div>
                <button type="submit" className="btn btn-info" disabled={isLoadingUser}>
                    {isLoadingUser ? "Cargando..." : "Publicar"}
                </button>
            </form>
        </div>
    );
}
