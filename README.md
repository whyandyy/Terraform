# Terraform Project
## Описание проекта
Проект с использованием инструмента Terraform для автоматизации создания инфраструктуры в облаке. Основные выполненные задачи:

1. Создание 3 ВМ на базе образа CentOS 7.
2. Создание сети и подключения ВМ к сети.
3. Настройка безопасности и конфигурации виртуальных машин с использованием `cloud-init`.

## Шаги выполнения
### 1. Установка Terraform, создание проекта и файла main.tf
![image](https://github.com/user-attachments/assets/123163b5-2a4a-4846-8fe7-c40e6699e6b4)
![image](https://github.com/user-attachments/assets/e6c0edc7-4c5d-4461-bb6f-90224ac34644)

### 1. Создание виртуальных машин
Были созданы 3 ВМ с именами:
- `ITHUBterraforubuntuper1-$Fedorov-An`
- `ITHUBterraforubuntuper2-$Fedorov-An`
- `ITHUBterraforubuntuper3-$Fedorov-An`

Каждая виртуальная машина:
- OS: CentOS 7.
- Дисковое пространство: 10 GB.
- Каждая ВМ была подключена к подсети и получила фиксированный IP-адрес:
  - 192.168.250.101 для первой машины.
  - 192.168.250.102 для второй машины.
  - 192.168.250.103 для третьей машины.

### 2. Создание сети
Для ВМ была создана сеть с именем `ITHUBterraformnetwork-$Fedorov-An`. В сети была создана подсеть с адресом `192.168.250.0/24`. Все машины были подключены к этой подсети.

### 3. Создание маршрутизатора
Создан новый маршрутизатор с именем `ITHUBterraformrouter-$Fedorov-An`.

### 4. Настройка безопасности
Для ВМ была добавлена группа безопасности, которая разрешает:
- Входящий трафик на порты 22 (TCP), 80 (TCP), 443 (TCP).
- Исходящий трафик на порт 53 (UDP) для DNS-запросов.

### 5. Конфигурация виртуальных машин
С помощью `cloud-init` была настроена автоматическая установка необходимых пакетов на ВМ:
- Установлены `curl`, `wget` и `nginx`.


## Процесс выполнения
### terraform init
![image](https://github.com/user-attachments/assets/bb999432-e452-49af-8d26-e3f86b65f36c)
### terraform validate
![image](https://github.com/user-attachments/assets/9bf0eb95-d719-4237-acd6-6567a82940a5)
### Вывод output после выполнения:
![image](https://github.com/user-attachments/assets/b9f7419a-1824-4747-ac42-d6df0acd2e34)


## Скрины из VK Cloud:
### ВМ1 
![image](https://github.com/user-attachments/assets/f8dac7fc-7073-42f6-ab04-68c34980a837)
![image](https://github.com/user-attachments/assets/0cfa0075-0012-4a48-9383-2169bed52663)
![image](https://github.com/user-attachments/assets/f6ac807e-66e4-40fd-a435-3dcef6b3a822)

### ВМ2
![image](https://github.com/user-attachments/assets/ef66c1a4-b3b9-40ac-a259-e948e63d2d4a)
![image](https://github.com/user-attachments/assets/c0bfc5af-a404-490e-a1e2-f9035a510ce8)
![image](https://github.com/user-attachments/assets/1133a0ca-9675-4f0f-9b9b-c6ac41a9110b)

### ВМ3
![image](https://github.com/user-attachments/assets/799bf3ba-103e-4d56-8319-3eab01d38188)
![image](https://github.com/user-attachments/assets/dc0aab6c-e8f7-4c06-a6b0-264cd739b456)
![image](https://github.com/user-attachments/assets/8375a40e-9072-448f-b7f8-6d530c0f1986)


















