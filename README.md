```bash
docker run --rm --volume "$(pwd):/projeto" -ti iactools:latest terraform-docs markdown . > teste.md     
docker run --rm --volume "$(pwd):/projeto" -ti iactools:latest terraform [ init, plan, apply, destroy]
docker run --rm --volume "$(pwd):/projeto" -ti iactools:latest tofu [ init, plan, apply, destroy]
docker run --rm --volume "$(pwd):/projeto" -ti iactools:latest terragrunt [ init, plan, apply, destroy]
# docker run --rm --volume "$(pwd):/projeto" -ti iactools:latest tflint
# docker run --rm --volume "$(pwd):/projeto" -ti iactools:latest tfsec
# docker run --rm --volume "$(pwd):/projeto" -ti iactools:latest checkov
# docker run --rm --volume "$(pwd):/projeto" -ti iactools:latest pre-commit run --all-files
```
