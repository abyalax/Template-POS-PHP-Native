<table id="userTable">
    <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Phone</th>
        </tr>
    </thead>
    <tbody>
        {if isset($users[0])}
        {foreach from=$users item=user}
        <tr>
            <td>{$user.id}</td>
            <td>{$user.name}</td>
            <td>{$user.email}</td>
            <td>{$user.phone}</td>
        </tr>
        {/foreach}
        {elseif isset($users)}
        <tr>
            <td>{$users.id}</td>
            <td>{$users.name}</td>
            <td>{$users.email}</td>
            <td>{$users.phone}</td>
        </tr>
        {else}
        <tr>
            <td colspan="4">No users found</td>
        </tr>
        {/if}
    </tbody>
</table>
<button onclick="getAllData()">Get All Data</button>

<script>
    function getAllData() {
        console.log(typeof jQuery);
        $.ajax({
            url: "/public/api.php",
            type: "GET",
            data: { action: "user.getAllUsers" },
            dataType: "json",
            success: function (response) {
                console.log('Success Get', response.data);

                let tbody = $("#userTable tbody");
                tbody.empty();

                if (response.data && response.data.length > 0) {
                    response.data.forEach(function (user) {
                        console.log('User : ', user);

                        let row =
                            "<tr>" +
                            "<td>" + (user.id ? user.id : "N/A") + "</td>" +
                            "<td>" + (user.name ? user.name : "N/A") + "</td>" +
                            "<td>" + (user.email ? user.email : "N/A") + "</td>" +
                            "<td>" + (user.phone ? user.phone : "N/A") + "</td>" +
                            "</tr>";
                        tbody.append(row);
                    });
                } else {
                    tbody.append('<tr><td colspan="3">No data available</td></tr>');
                }
            },
            error: function (xhr, status, error) {
                console.log(xhr);
                console.log(error);
                console.error("AJAX Error:", status, error);
            }
        });
    }
</script>