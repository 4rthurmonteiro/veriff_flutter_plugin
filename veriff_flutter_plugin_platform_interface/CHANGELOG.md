
## [1.0.0] 

### Added

- Initial stable release of the Veriff Flutter Plugin Platform Interface.
- `VeriffFlutterPluginPlatformInterface` abstract class defining the platform contract.
- `VeriffFlutterPluginMethodChannel` default implementation using native Veriff SDK.
- `startVerification()` method to initiate Veriff identity verification sessions.
- `getUri()` method for web platform callback URL handling.
- Support for custom branding, language locales, and vendor data.
- Full documentation for all public APIs.
- MIT License.

### Features

- Cross-platform support (iOS, Android, Web).
- Customizable verification flow with branding options.
- Language locale configuration for internationalization.
- Custom intro screen support.
- Web platform window targeting (`_self` or `_blank`).
