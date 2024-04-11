FROM cgr.dev/chainguard/wolfi-base 
#alpine:latest
ARG PRODUCT=terraform
ARG VERSION=1.7.5
## Install terraform 
RUN apk update && apk add wget && cd /tmp && \
    wget https://releases.hashicorp.com/${PRODUCT}/${VERSION}/${PRODUCT}_${VERSION}_linux_amd64.zip && \
    # wget https://releases.hashicorp.com/${PRODUCT}/${VERSION}/${PRODUCT}_${VERSION}_SHA256SUMS && \
    # wget https://releases.hashicorp.com/${PRODUCT}/${VERSION}/${PRODUCT}_${VERSION}_SHA256SUMS.sig && \
    # wget -qO- https://www.hashicorp.com/.well-known/pgp-key.txt | gpg --import && \
    # gpg --verify ${PRODUCT}_${VERSION}_SHA256SUMS.sig ${PRODUCT}_${VERSION}_SHA256SUMS && \
    # grep ${PRODUCT}_${VERSION}_linux_amd64.zip ${PRODUCT}_${VERSION}_SHA256SUMS | sha256sum -c && \
    unzip /tmp/${PRODUCT}_${VERSION}_linux_amd64.zip && \
    mv /tmp/${PRODUCT} /usr/bin/${PRODUCT} && \
    rm -f /tmp/${PRODUCT}_${VERSION}_linux_amd64.zip 
## Install terragrunt
ARG TERRAGRUNT_VERSION=v0.55.18
RUN wget https://github.com/gruntwork-io/terragrunt/releases/download/${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 && \
    mv terragrunt_linux_amd64 /usr/bin/terragrunt && \
    chmod +x /usr/bin/terragrunt

## Terraform Docs
ARG TERRAFORM_DOCS_VERSION=v0.17.0 
RUN wget https://github.com/terraform-docs/terraform-docs/releases/download/${TERRAFORM_DOCS_VERSION}/terraform-docs-${TERRAFORM_DOCS_VERSION}-linux-amd64.tar.gz && \
    tar -xzf terraform-docs-${TERRAFORM_DOCS_VERSION}-linux-amd64.tar.gz && \
    chmod +x terraform-docs && \
    mv terraform-docs /usr/bin/terraform-docs && \
    rm -f terraform-docs.terraform-docs-${TERRAFORM_DOCS_VERSION}-linux-amd64.tar.gz 

## Opentofu
ARG TOFU_VERSION=1.6.2
RUN wget https://github.com/opentofu/opentofu/releases/download/v${TOFU_VERSION}/tofu_${TOFU_VERSION}_amd64.apk && \
    apk add --allow-untrusted tofu_*.apk && \ 
    rm  -f install-opentofu.sh 


WORKDIR /projeto

