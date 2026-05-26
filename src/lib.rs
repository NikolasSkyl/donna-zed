use zed_extension_api::{self as zed, LanguageServerId, Result};

struct DonnaExtension;

impl zed::Extension for DonnaExtension {
    fn new() -> Self {
        DonnaExtension
    }

    fn language_server_command(
        &mut self,
        _language_server_id: &LanguageServerId,
        _worktree: &zed::Worktree,
    ) -> Result<zed::Command> {
        Ok(zed::Command {
            command: "donna".to_string(),
            args: vec!["lsp".to_string()],
            env: Default::default(),
        })
    }
}

zed::register_extension!(DonnaExtension);
