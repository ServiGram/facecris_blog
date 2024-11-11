import { useState } from "react";
import { deletePost, truncateTitle } from "../functions/functions";
import "./styles/postcard.css"
import { useAuth } from "../functions/AuthContext";

interface Post {
    id: number;
    title: string;
    content: string;
    image: string;
}

interface PostCardProps {
    post: Post;
    onPostDelete: () => Promise<void>; // Agregar el tipo de onPostDelete aquí
}

export function PostCard({ post, onPostDelete }: PostCardProps) {
    const handleDelete = async () => {
        try {
            await deletePost(post.id); // Llama a la función de eliminación
            onPostDelete(); // Vuelve a cargar los posts al eliminar
        } catch (error) {
            console.error("Error eliminando el post:", error);
        }
    };

    const [isExpanded, setIsExpanded] = useState(false);
    const { isAuthenticated } = useAuth();

    const toggleExpanded = () => {
        setIsExpanded(!isExpanded);
    };

    truncateTitle('.card-title', 40);

    return (
        <div className="container">
            <div className="card mb-4 p-1 post-card">
                <img src={post.image} className="card-img-top" alt={post.title} />
                <div className="card-body">
                    <h5 className="card-title">{post.title}</h5>

                    <p
                        className={`card-text ${isExpanded ? "" : "text-truncate"}`}
                        style={{
                            maxHeight: isExpanded ? "none" : "100px",
                            overflow: "hidden",
                        }}
                    >
                        {post.content}
                    </p>

                    {isAuthenticated && (
                        <div className="d-flex justify-content-between">
                            <button className="btn btn-danger btn-sm" onClick={handleDelete}>
                                Eliminar
                            </button>
                        </div>
                    )}
                </div>
            </div>
        </div>

    );
}