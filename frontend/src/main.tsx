import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import './index.css'
import {
    createBrowserRouter,
    RouterProvider,
  } from "react-router-dom";
import Browse from './pages/Browse';
const router = createBrowserRouter([
  {
    path: "/",
    element: <Browse/>,
  },
//   {
//     path: "/search",
//     element: <SearchDetails/>
//   },
//   {
//     path: "/recipe/:slug",
//     element: <RecipeDetails/>
//   },
//   {
//     path: "/category/:slug",
//     element: <CategoryDetails/>
//   }
]);
createRoot(document.getElementById('root')!).render(
  <StrictMode>
     <RouterProvider router={router} />
  </StrictMode>,
)
