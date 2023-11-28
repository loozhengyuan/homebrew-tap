class Unwarp < Formula
    desc "Disable Cloudflare WARP on macOS"
    homepage "https://github.com/loozhengyuan/unwarp"
    url "https://github.com/loozhengyuan/unwarp.git",
        # tag: "v0.1.0"
        revision: "34578f16bdb1f7ace675770314f6de81b4908a7c"
    head "https://github.com/loozhengyuan/unwarp.git",
        branch: "main"
    version "0.1.0"
    license "MIT"
    revision 1

    def install
        bin.install "src/unwarp.sh" => "unwarp"
    end

    service do
        run opt_bin/"unwarp"
        keep_alive successful_exit: true
        environment_variables PATH: std_service_path_env
        log_path var/"log/unwarp.log"
        error_log_path var/"log/unwarp.log"
    end

    test do
        assert_match version.to_s, shell_output("#{bin}/unwarp -v 2>&1")
    end
end
