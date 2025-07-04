# Changelog
## [2.1.0] - 2025-06-17

### ✨ Added
- Full migration from `requests` package to `http` package (`http 1.4.0`) for better compatibility with modern Flutter projects

### 🛠 Changed
- Updated all internal API calls to use `http` instead of `requests`
- Improved consistency in request headers and error handling

### ✅ Compatibility
- Compatible with Flutter SDKs requiring `http 1.4.0` and higher
- Resolves version conflict issues with newer projects using latest `http` package



## [2.0.1] - 2025-05-09

### ✨ Added
- Support for sending **raw HTML strings** in emails

### 🛠 Changed
- Updated `README.md` to showcase HTML preview and usage
- Cleaned up method documentation and added examples

### 🔧 Breaking Changes
- None, all previous methods remain supported



## [1.5.1] - 2025-05-02
### Changed
- Updated README with clearer usage examples and formatting.
- Enhanced code readability for better maintenance.

### Improved
- Improved performance through optimized internal logic and reduced redundant operations.

## [1.4.2] - 2024-8-1
### Improved
- Minimized api response time from 1000ms to 0ms
### Changed
- Improved documentation of code 

## [1.3.1] - 2023-10-20
### Changed
- decreased dart min sdk version

## [1.2.7] - 2023-10-05
### Added
- improved performance

## [1.2.3] - 2023-10-05
### Fixed
- removed bugs
### Added
- improved quality of code

## [1.1.4] - 2023-09-13
### Changed
- Updated the README with installation and usage instructions.
- Refactored code for improved performance and readability.
- improved error handling methods
- changed file and class names
- improved quality of code

## [1.1.3] - 2023-09-10
### Added
- Initial release of the package.
- Implemented basic email sending functionality.
- Included support for sending OTP verification messages.
- Provided examples and documentation for usage.

### Changed
- Updated the README with installation and usage instructions.
- Refactored code for improved performance and readability.

### Fixed
- Resolved a bug related to email attachments.
- Fixed issues with email authentication.
