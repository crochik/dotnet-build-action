echo "First one"
echo ${INPUT_BUILD_CONTEXT}
docker build ${INPUT_BUILD_CONTEXT} -f dotnet.Dockerfile
