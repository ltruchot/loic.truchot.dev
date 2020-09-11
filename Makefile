BUCKET_URL=s3://loic.truchot.dev
deploy:
	@zola build
	@aws s3 sync ./public ${BUCKET_URL} --acl public-read --follow-symlinks --delete

.PHONY: deploy