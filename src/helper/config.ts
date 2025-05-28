import nativeToast from 'native-toast'
import { ToastOptions } from 'native-toast'

export const domain = import.meta.env.DOMAIN
export const base_url = import.meta.env.BASE_URL

export function toast({
    message,
    type,
    timeout = 5000,
    position = 'north-east',
}: ToastOptions): void {
    nativeToast({
        message,
        type,
        timeout: timeout,
        position: position
    })
}