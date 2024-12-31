import { StrictMode } from "react";
import { createRoot } from "react-dom/client";
import "./index.css";
import { createBrowserRouter, RouterProvider } from "react-router-dom";
import Browse from "./pages/Browse";
import "swiper/swiper-bundle.css";
import SearchDetails from "./pages/SearchDetails";
import CategoryDetails from "./pages/CategoryDetails";

const router = createBrowserRouter([
    {
        path: "/",
        element: <Browse />,
    },
    {
        path: "/search",
        element: <SearchDetails />,
    },
    {
        path: "/category/:slug",
        element: <CategoryDetails />,
    },
    //   {
    //     path: "/recipe/:slug",
    //     element: <RecipeDetails/>
    //   },
]);
createRoot(document.getElementById("root")!).render(
    <StrictMode>
        <RouterProvider router={router} />
    </StrictMode>
);
