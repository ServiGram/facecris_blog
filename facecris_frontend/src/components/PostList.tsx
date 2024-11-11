import { useEffect, useState } from "react";
import { getAllPosts } from "../api/posts.api";
import { PostCard } from "./PostCard";

interface Post {
    id: number;
    title: string;
    content: string;
    image: string;
}

export function PostList() {
    const [posts, setPosts] = useState<Post[]>([]);

    const loadPosts = async () => {
        const res = await getAllPosts();
        setPosts(res.data);
    };

    useEffect(() => {
        loadPosts();
    }, []);

    return (
        <div className="container mt-3">
            <div className="row">
                {posts.map((post) => (
                    <div key={post.id} className="col-12 col-sm-6 col-md-4 col-lg-3 mb-4">
                        <PostCard post={post} onPostDelete={loadPosts} />
                    </div>
                ))}
            </div>
        </div>
    );
}

