To run test:

mvn clean test -Dkarate.options="--tags @${tag1}"

For example:

mvn clean test -Dkarate.options="--tags @regression"