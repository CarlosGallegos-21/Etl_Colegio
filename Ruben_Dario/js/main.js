function cargarDatos(){
    var cod = document.getElementById("periodo").value; 
    var ctx = document.getElementById("canvas");

    let canvarImagen = document.getElementById('cnImagen');
    let ctx2 = canvarImagen.getContext('2d');
    let logo = document.createElement('img');
    logo.src = "./img/descarga.png";

    logo.addEventListener('load', () => {
        ctx2.drawImage(logo,0.5,0.5,225,225,0.5,0.5,225,225);
    });

    var myChart = new Chart(ctx, {
        type: 'doughnut',
        data: {
        datasets: [{
            backgroundColor: [
            'rgba(99, 0, 198, 0.5)',
            'rgba(198, 100, 39, 0.5)',
            'rgba(198, 0, 0, 0.5)',
            'rgba(198, 198, 0, 0.5)',
            'rgba(99, 198, 0, 0.5)',
            'rgba(0, 198, 198, 0.5)',
            'rgba(0, 0, 198, 0.5)',
            'rgba(0, 45, 45, 0.5)',
            'rgba(198, 172, 0, 0.5)',
            'rgba(255, 101, 244, 0.5)',
            'rgba(53, 92, 190, 0.5)',
            'rgba(112, 254, 152, 0.5)',
            'rgba(1, 24, 2, 0.5)',
            'rgba(214, 147, 148, 0.5)'
            ],
            borderColor: [
            'rgba(99, 0, 198, 1)',
            'rgba(198, 100, 39, 1)',
            'rgba(198, 0, 0, 1)',
            'rgba(198, 198, 0, 1)',
            'rgba(99, 198, 0, 1)',
            'rgba(0, 198, 198, 1)',
            'rgba(0, 0, 198, 1)',
            'rgba(0, 45, 45, 1)',
            'rgba(198, 172, 0, 1)',
            'rgba(255, 101, 244, 1)',
            'rgba(53, 92, 190, 1)',
            'rgba(112, 254, 152, 1)',
            'rgba(1, 24, 2, 1)',
            'rgba(214, 147, 148, 1)'
            ],
            borderWidth: 1
        }]
        },
        options: {
        cotoutPercentage: 10,
        rotation: Math.PI * 0.5,
        animation: {
            animateScale: true
        }
        },
        error: function(data) {
            console.log(data);
        }
    })

    let url = 'http://localhost/ruben_dario/desercion.php?periodo='+cod
    fetch(url)
        .then( response => response.json())
        .then(datos => mostrar(datos))
        .catch(error => console.log(error))

    const mostrar = (desercion) => {
        desercion.forEach(element => {
            myChart.data['labels'].push(element.Curso +' "'+ element.Paralelo+'"')
            myChart.data['datasets'][0].data.push(element.Suma)
            myChart.update()
        });
    }
}