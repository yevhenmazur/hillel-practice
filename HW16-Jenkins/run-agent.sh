docker run -d --rm --name=agent --publish 4444:22 -e "JENKINS_AGENT_SSH_PUBKEY=ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQD05pUlVwrii1/t+nFgp7j/5qIY1pJPBNbPpzWkeCHvCQnXB1mkyT3FKafkcSX88rl6TnAvGOEjtyi/F53O0MaNxUu46vRVxhGpyS43be+QZ5MU9Avr6Tlppz9TiqpP2Pue6I9tjFre1fkIlMsKAyEI44vOjwIlV42iIprz5oTaep/9mSOm91leg/P1+duEPv2T0u7PnyTIS5Bi5J0aABZkfFzGVxTKGJ7f4beUxcEhmvfsRCkUs5M3D7P0pLToohGJeTAS3oVavuPkkLnnP72nITeZV3OLUfgZVk91aOqgAdHtf0160Ad+aWu4EaC+REXj1ABEpV2l1Vp1S51cM9oQkMMugvhPtOdnbBfA05fT6yPBbLt7ryomXUJ0ydTsKY/LUXczvbhv37tXHXQjMgpEHah1dG6POFqaLMsR5JP2+2GtkW84dMqeHop04pA8/aEO2NCdJsFj9gN/55NBLZHHVLVL7EZz+HkEoU3PLi1R4TaJ5/5OHuYMmkE+GfkZcuc= virtual@ubuntu-hillel" jenkins/ssh-agent
