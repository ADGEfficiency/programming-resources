
#  need this in just - not in make
ENVIRONMENT := "$ENVIRONMENT"

system-info:
  @echo "{{arch()}} on {{os()}}"
  @echo "Data Science South: {{ENVIRONMENT}}"
