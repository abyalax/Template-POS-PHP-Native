import { Category, Product } from "../../types/product";

export const addCategory = async (name: string) => {
    try {
        const fetchData = await fetch('/point-of-sales/api/product/category/create', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            credentials: 'include',
            body: JSON.stringify({ name })
        });
        const response = await fetchData.json();
        console.log('Add Category Response: ' ,response);
        return response.data;
    } catch (error) {
        console.log('Get Product Error: ', error);
        return '';
    }
}

export const getCategories = async (): Promise<Category[]> => {
    try {
        const fetchData = await fetch('/point-of-sales/api/product/categories', {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            },
            credentials: 'include',
        });
        const response = await fetchData.json();
        console.log('Get Category Response: ', response);
        return response.data;
    } catch (error) {
        console.log('Get Category Error: ', error);
        return [];
    }
}

export const getCategoryByID = async (id: number) => {
    try {
        const fetchData = await fetch(`/point-of-sales/api/product/category/${id}`, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            },
            credentials: 'include',
        });
        const response = await fetchData.json();
        console.log('Get CategoryByID Response: ', response);
        return response.data;
    } catch (error) {
        console.log('Get CategoryByID Error: ', error);
        return;
    }
}

export const addProduct = async (product: Product) => {
    try {
        const fetchData = await fetch('/point-of-sales/api/product/create', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            credentials: 'include',
            body: JSON.stringify(product)
        });
        const response = await fetchData.json();
        console.log('Add Product Response: ', response);
        return response.status;
    } catch (error) {
        console.log('Get Product Error: ', error);
        return 'failed';
    }
}

export const updateProduct = async (product: Product): Promise<number> => {
    try {
        const fetchData = await fetch(`/point-of-sales/api/product/update/${product.id}`, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json'
            },
            credentials: 'include',
            body: JSON.stringify(product)
        });
        return fetchData.status;
    } catch (error) {
        console.log('Update Product Error: ', error);
        return 400;
    }
}

export const getProducts = async (): Promise<Product[]> => {
    try {
        const fetchData = await fetch('/point-of-sales/api/products', {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            },
            credentials: 'include',
        });
        const response = await fetchData.json();
        return response.data;
    } catch (error) {
        console.log('Get Product Error: ', error);
        return [];
    }
}

export const getProductByID = async (id: number) => {
    try {
        const data = new URLSearchParams();
        data.append('id', id.toString());

        const fetchData = await fetch('/point-of-sales/api/product/id', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            credentials: 'include',
            body: data.toString()
        });

        const response = await fetchData.json();
        console.log(response);

        return response.data
    } catch (error) {
        console.log('Get Product Error: ', error);
        return [];
    }
}