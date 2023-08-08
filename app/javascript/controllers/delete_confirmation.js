// app/javascript/delete_confirmation.js

document.addEventListener('DOMContentLoaded', () => {
    const deleteButton = document.getElementById('delete-button');

    if (deleteButton) {
        deleteButton.addEventListener('click', (event) => {
            event.preventDefault();

            const confirmationMessage = 'Are you sure?';
            if (confirm(confirmationMessage)) {
                const form = event.target.closest('form');
                if (form) {
                    form.submit();
                }
            }
        });
    }
});
