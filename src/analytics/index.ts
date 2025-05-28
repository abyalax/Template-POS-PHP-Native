import { CategoryScale, Chart, BarController, LinearScale, LineController, LineElement, PointElement, BarElement, Filler, Tooltip, PieController, ArcElement, Legend } from "chart.js";
import AnalyticsUI from "./ui";

Chart.register([
    CategoryScale,
    BarController,
    BarElement,
    LineController,
    LineElement,
    PieController,
    ArcElement,
    LinearScale,
    PointElement,
    Filler,
    Tooltip,
    Legend,
]);

document.addEventListener('DOMContentLoaded', () => {
    new AnalyticsUI()
})