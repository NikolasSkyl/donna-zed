use zed_extension_api::{self as zed, LanguageServerId, Result};

struct DonnaExtension;

impl zed::Extension for DonnaExtension {
    fn new() -> Self {
        DonnaExtension
    }

    fn language_server_command(
        &mut self,
        _language_server_id: &LanguageServerId,
        worktree: &zed::Worktree,
    ) -> Result<zed::Command> {
        let donna = worktree
            .which("donna")
            .ok_or_else(|| "donna not found in PATH — make sure it is installed".to_string())?;
        Ok(zed::Command {
            command: donna,
            args: vec!["lsp".to_string()],
            env: Default::default(),
        })
    }
}

zed::register_extension!(DonnaExtension);
