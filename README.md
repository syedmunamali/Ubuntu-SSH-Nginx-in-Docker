# Before ruuning this file add keys and index.html file in the same directory
# Key name should be id_rsa
# In case of any error regarding the user change its name
# To generate keys use this command in the same directory ssh-kegen -t rsa -m PEM -f id_rsa
# cd
# After building the image perform the given commands in terminal 
# ll .ssh/
# rm -rf .ssh/id_rsa
# rm -rf .ssh/id_rsa.pub 
# cd -
# ll
# cp -prfv id_rsa* ~/.ssh/
# Check output with this command ssh remote_user@localhost -p PORT_NUMBER_SPECIFIED_ON_DOCKER_RUN 
# Check output with this command ssh -i id_rsa remote_user@localhost -p PORT_NUMBER_SPECIFIED_ON_DOCKER_RUN
