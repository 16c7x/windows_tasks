plan windows_tasks::ad_task (
  $puppet_host,
  $windows_host,
  $hierakey,
  $environment,
)
{
  $password_data = run_task('windows_tasks::get_password', $puppet_host, { hierakey => $hierakey, environment => $environment})
  $ad_password = Sensitive($password_data.map |$items| {$items.sensitive.unwrap})
  run_task('windows_tasks::ad_join', $windows_host, { password => $ad_password.unwrap[0]})
}
