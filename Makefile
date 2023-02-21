build_canvas: ## Build the canvas version of the app
	@echo "Building canvas..."
	@flutter build web --web-renderer canvaskit --release
	@echo Done!

build_html: ## Build the html version of the app
	@echo "Building html..."
	@flutter build web --web-renderer html --release
	@echo Done!