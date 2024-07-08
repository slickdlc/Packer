
packer{
    required_plugins {
        amazon = {
            version = ">= 1.0.0"
            source = "github.com/hashicorp/amazon"
        }
    }
}


source "amazon-ebs" "actividad" {
    access_key = "###"
    secret_key = "###"
    ami_name = "actividad-app-1"
    source_ami = "ami-06c68f701d8090592"
    instance_type = "t2.micro"
    region = "us-east-1"
    ssh_username = "ec2-user"
}

build {
    sources = [
        "source.amazon-ebs.actividad"
    ]

    provisioner "file" {
        source = "./actividad_app.js"
        destination = "/home/ec2-user/actividad_app.js"
    }

    provisioner "file" {
        source = "./actividad.service"
        destination = "/tmp/actividad.service"
    }

    provisioner "shell" {
        script = "./app.sh"
    }
}