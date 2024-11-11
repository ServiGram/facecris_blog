import axios from 'axios';

export const deletePost = async (postId: any) => {
    const token = localStorage.getItem('access_token');
    try {
        await axios.delete(`http://127.0.0.1:8000/api/posts/${postId}/`, {
            headers: {
                'Authorization': `Bearer ${token}`,
            }
        });
        console.log("Post eliminado con éxito");
    } catch (error) {
        console.error("Error eliminando el post:", error);
        throw error;
    }
};

export function truncateTitle(selector: string, maxLength: number): void {
    const elements = document.querySelectorAll<HTMLElement>(selector);
    elements.forEach(element => {
        const originalText = element.textContent?.trim() || '';
        if (originalText.length > maxLength) {
            const truncatedText = originalText.slice(0, maxLength) + '...';
            element.textContent = truncatedText;
        }
    });
}

