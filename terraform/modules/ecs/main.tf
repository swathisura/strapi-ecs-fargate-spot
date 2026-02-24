# ECS Cluster
resource "aws_ecs_cluster" "this" {
  name = var.cluster_name
}

# Random suffix for SG name to avoid duplicates
resource "random_id" "sg_suffix" {
  byte_length = 2
}

# Security Group
resource "aws_security_group" "ecs" {
  name   = "${var.cluster_name}-sg-${random_id.sg_suffix.hex}"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 1337
    to_port     = 1337
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# ECS Task Definition
resource "aws_ecs_task_definition" "this" {
  family                   = var.cluster_name
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "512"
  memory                   = "1024"
  execution_role_arn       = var.ecs_execution_role_arn

  container_definitions = jsonencode([
    {
      name      = "strapi-app"
      image     = var.ecr_image_url
      essential = true
      portMappings = [
        {
          containerPort = 1337
          protocol      = "tcp"
        }
      ]
    }
  ])
}

# ECS Service using Fargate Spot
resource "aws_ecs_service" "this" {
  name            = var.cluster_name
  cluster         = aws_ecs_cluster.this.id
  task_definition = aws_ecs_task_definition.this.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = var.subnets
    security_groups  = [aws_security_group.ecs.id]
    assign_public_ip = true
  }

  capacity_provider_strategy {
    capacity_provider = "FARGATE_SPOT"
    weight            = 1
  }

  depends_on = [aws_ecs_task_definition.this]
}
