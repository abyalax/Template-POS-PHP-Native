{literal}
    <script>
        $(document).ready(function() {
            var elResponse = document.getElementById('response');
            const email = document.querySelector('input[name="email"]');
            const password = document.querySelector('input[name="password"]');
            $("#updateUserForm").submit(function(e) {
                e.preventDefault();
                const formData = new FormData();

                formData.append('email', email.value);
                formData.append('password', password.value);

                fetch('api/login', {
                        method: 'POST',
                        body: formData
                    }).then(response => {
                        // Handle redirect
                        if (response.redirected) {
                            window.location.href = response.url;
                        }
                        // Handle response JSON (jika tidak redirect)
                        else {
                            return response.json().then(data => {
                                elResponse.innerText = data.message;
                            });
                        }
                    })
                    .catch(error => {
                        console.error('Error:', error);
                    });
            });
        });
    </script>
{/literal}

<div id="box-login-form" style="display:none;width: 800px;">
    <h2>Post Data with JQuery</h2>
    <form id="updateUserForm" class="w-100">
        <div class="mb-3">
            <label class="form-label">Email</label>
            <input id="emailInput" class="form-control form-control-lg" type="email" name="email"
                placeholder="Enter your email" />
        </div>
        <div class="mb-3">
            <label class="form-label">Password</label>
            <input id="passwordInput" class="form-control form-control-lg" type="password" name="password"
                placeholder="Enter your password" />
        </div>
        <div>
            <div class="form-check align-items-center">
                <input id="customControlInline" type="checkbox" class="form-check-input" value="remember-me"
                    name="remember-me" checked>
                <label class="form-check-label text-small" for="customControlInline">
                    Remember me
                </label>
            </div>
        </div>
        <div class="d-grid gap-2 mt-3">
            <button type="submit" class="btn btn-lg btn-primary">Sign in</button>
        </div>
        <p id="response" class="my-3">response</p>
    </form>
</div>