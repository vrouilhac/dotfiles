local status_ok, sniprun = pcall(require, "sniprun")
if not status_ok then
  return
end

sniprun.setup(
  {
    display = {
      "Terminal"
    },
    display_options = {
      notification_timeout = 10 -- in seconds
    }
  }
)
