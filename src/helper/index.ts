
export function formatPrice(price: number) {
    return new Intl.NumberFormat('id-ID', { style: 'currency', currency: 'IDR' }).format(price);
}

export function parsePrice(formatted: string): number {
    return Number(
        formatted
            .replace(/[^0-9,-]/g, '') // Hapus "Rp", spasi, dan simbol lain
            .replace(',', '.')        // Ganti koma desimal ke titik (jika ada)
    );
}
