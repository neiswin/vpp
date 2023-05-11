// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "chartkick/chart.js"
import Chart from 'chart.js/auto';
import * as bootstrap from "bootstrap"




const ctx = document.getElementById('myChart');

const trend1 = JSON.parse("[" + ctx.dataset.data + "]");

// debugger

const labels = ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'];

const data = {
  labels: labels,
  datasets: [
    {
      label: 'Dataset 1',
      data: trend1[0],
      borderColor: '#36A2EB',
      backgroundColor: '#9BD0F5',
      yAxisID: 'y',
    },
    {
      label: 'Dataset 2',
      data: [-3, 5, 2, 1, 4, 6],
      borderColor: '#FF6384',
      backgroundColor: '#FFB1C1',
      // yAxisID: 'y1',
    }
  ]
};

new Chart(ctx, {
  type: 'line',
  data: data,
  options: {
    scales: {
      y: {
        beginAtZero: true
      }
    }
  }
});