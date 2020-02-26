alter table
    bernie_mjohnson2.illinois_ev_sites
add
    column ev_start_date varchar(4000);
    
update
    bernie_mjohnson2.illinois_ev_sites
set
    ev_start_date = regexp_replace(
        ev_dates,
        '^.*((Feb|Mar|March|February|MAR|MARCH|FEB|FEBRUARY)\.? \\d{1,2}).*$',
        '$1'
    )
where
    ev_start_date is null
    and ev_dates != regexp_replace(
        ev_dates,
        '^.*((Feb|Mar|March|February|MAR|MARCH|FEB|FEBRUARY)\.? \\d{1,2}).*$',
        '$1'
    );
update
    bernie_mjohnson2.illinois_ev_sites
set
    ev_start_date = regexp_replace(
        replace(ev_dates, '2/06/20', 'Feb 6'),
        '^.*((Feb|Mar|March|February|MAR|MARCH|FEB|FEBRUARY)\.? \\d{1,2}).*$',
        '$1'
    )
where
    ev_start_date is null
    and position('2/06/20' in ev_dates) > 0;
update
    bernie_mjohnson2.illinois_ev_sites
set
    ev_start_date = regexp_replace(
        replace(ev_dates, '2-6-2020', 'Feb 6'),
        '^.*((Feb|Mar|March|February|MAR|MARCH|FEB|FEBRUARY)\.? \\d{1,2}).*$',
        '$1'
    )
where
    ev_start_date is null
    and position('2-6-2020' in ev_dates) > 0;
update
    bernie_mjohnson2.illinois_ev_sites
set
    ev_start_date = regexp_replace(
        replace(ev_dates, '02/06/2020', 'Feb 6'),
        '^.*((Feb|Mar|March|February|MAR|MARCH|FEB|FEBRUARY)\.? \\d{1,2}).*$',
        '$1'
    )
where
    ev_start_date is null
    and position('02/06/2020' in ev_dates) > 0;