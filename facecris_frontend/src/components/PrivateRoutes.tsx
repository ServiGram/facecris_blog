import { Navigate } from "react-router-dom";
import { useAuth } from "../functions/AuthContext";

interface PrivateRouteProps {
    children: JSX.Element;
    isAdminOnly?: boolean;
}

export function PrivateRoute({ children, isAdminOnly = false }: PrivateRouteProps) {
    const { isAuthenticated, isAdmin, loading } = useAuth();

    if (loading) {
        return <div>Loading...</div>;
    }

    if (!isAuthenticated) {
        return <Navigate to="/login" />;
    }

    if (isAdminOnly && !isAdmin) {
        return <Navigate to="/" />;
    }

    return children;
}



