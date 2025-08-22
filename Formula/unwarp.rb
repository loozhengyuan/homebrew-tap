class Unwarp < Formula
  desc "Disable Cloudflare WARP on macOS"
  homepage "https://github.com/loozhengyuan/unwarp"
  url "https://github.com/loozhengyuan/unwarp.git",
    tag:      "v0.2.0",
    revision: "1e698585c77cb864dd5fc78ea88999bc30f3a5df"
  license "MIT"
  head "https://github.com/loozhengyuan/unwarp.git",
    branch: "main"

  def install
    bin.install "src/unwarp.sh" => "unwarp"
  end

  service do
    run "#{opt_bin}/unwarp"
    keep_alive always: true
    # NOTE: `/usr/local/bin` may not be always be in `std_service_path_env`
    # depending on the target os and architecture so we explicitly add it.
    environment_variables PATH: "#{std_service_path_env}:/usr/local/bin"
    log_path "#{var}/log/unwarp.log"
    error_log_path "#{var}/log/unwarp.log"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/unwarp -v 2>&1")
  end
end
