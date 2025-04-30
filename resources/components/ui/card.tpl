<div class="card col px-2">
    <div class="card-body d-flex     flex-column gap-1">
        <p>{$title}</p>
        <div class="col-auto d-flex justify-content-start align-items-center gap-4" style="height: 2rem;">
            {$icon nofilter}
            <h4 class="fw-semibold text-nowrap">{$menu}</h4>
        </div>
        <a href="/point-of-sales/{$link}" class="btn btn-secondary" data-bs-toggle="tooltip" data-bs-placement="bottom"
        data-bs-title="You must login as {$role}">
        {$button}
        <i class="align-middle" data-feather="arrow-right"></i>
        </a>
        <span class="text-secondary fs-5">{$message}</span>
    </div>
</div>