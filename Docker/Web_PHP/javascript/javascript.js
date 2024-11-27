$(document).ready(function () {
    // Inicialización de Typed.js para mostrar múltiples mensajes
    var options = {
        strings: ["¡Hola, soy Jesús Macías!", "C++ Developer", "System Administrator", "Desarrollador Web", "Entusiasta de la Programación", "Creador de Soluciones"],
        typeSpeed: 50,
        backSpeed: 50,
        loop: true
    };
    var typed = new Typed(".element", options);

    // SPA (Single Page Application)
    $('a[data-page]').on('click', function (e) {
        e.preventDefault();
        var section = $(this).data('page');
        $('html, body').animate({
            scrollTop: $('#' + section).offset().top - $('.navbar').outerHeight()
        }, 800);
    });

    // Manejo del formulario de contacto y confirmación
    $('#contactForm').on('submit', function (e) {
        e.preventDefault();
        var email = $('#email').val();
        var message = $('#message').val();
        if (validateEmail(email) && message) {
            $('#confirmationModal').modal('show');
            $(this).trigger("reset"); // Reiniciar el formulario
        } else {
            alert("Por favor, ingresa un correo electrónico válido y un mensaje.");
        }
    });

    // Validar formato de correo electrónico
    function validateEmail(email) {
        var re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return re.test(String(email).toLowerCase());
    }

    // Filtrado de proyectos
    $('#search').on('keyup', function () {
        var searchTerm = $(this).val().toLowerCase();
        $('#project-list .project-card').each(function () {
            var title = $(this).data('title').toLowerCase();
            $(this).toggle(title.includes(searchTerm));
        });
    });

    // Cargar proyectos desde la base de datos usando AJAX
    fetch('./obtener_proyectos.php')
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok ' + response.statusText);
            }
            return response.json();
        })
        .then(data => {
            const projectList = $('#project-list');
            projectList.empty(); // Vaciar la lista actual de proyectos
            const modalContainer = $('body'); // Contenedor para agregar modales dinámicamente

            // Iterar sobre los proyectos recibidos y agregar cada uno al DOM
            data.forEach(project => {
                const projectCard = `
                    <div class="col-md-4 project-card" data-title="${project.nombre}">
                        <div class="card project-card" data-bs-toggle="modal" data-bs-target="#projectModal${project.id}">
                            <img src="./imagenes/${project.imagen}" class="card-img-top" alt="${project.nombre}">
                            <div class="card-body">
                                <h5 class="card-title">${project.nombre}</h5>
                                <p class="card-text">${project.descripcion}</p>
                            </div>
                        </div>
                    </div>
                `;
                projectList.append(projectCard);

                // Crear el modal para cada proyecto
                const projectModal = `
                    <div class="modal fade" id="projectModal${project.id}" tabindex="-1" aria-labelledby="projectModalLabel${project.id}" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="projectModalLabel${project.id}">${project.nombre}</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    ${project.descripcion}
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                `;
                modalContainer.append(projectModal); // Agregar modal al contenedor
            });
        })
        .catch(error => console.error('Error cargando los proyectos:', error));
});
