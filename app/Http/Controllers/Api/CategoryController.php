<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\Api\CategoryResource;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;

class CategoryController extends Controller
{
    public function index()
    {
        $categories = Cache::remember('categories', 3600, function () {
            return Category::withCount('recipes')->get();
        });
        return CategoryResource::collection($categories);
    }

    public function show(Category $category)
    {
        $category->load([
            'recipes' => function ($query) {
                $query->latest()
                    ->with(['category', 'author'])
                    ->paginate(12);
            }
        ]);
        $category->loadCount('recipes');
        return new CategoryResource($category);
    }

}
