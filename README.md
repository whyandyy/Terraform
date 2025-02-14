# Terraform Project
## Описание проекта
Проект с использованием инструмента Terraform для автоматизации создания инфраструктуры в облаке. Основные выполненные задачи:

1. Создание 3 виртуальных машин (VM) на базе образа CentOS 7.
2. Создание сети и подключения VM к сети.
3. Настройка безопасности и конфигурации виртуальных машин с использованием `cloud-init`.

## Шаги выполнения
### 1. Установка Terraform, создание проекта и файла main.tf
![image](https://github.com/user-attachments/assets/123163b5-2a4a-4846-8fe7-c40e6699e6b4)
![image](https://github.com/user-attachments/assets/e6c0edc7-4c5d-4461-bb6f-90224ac34644)

### 1. Создание виртуальных машин
Были созданы 3 виртуальные машины с именами:
- `ITHUBterraforubuntuper1-$Fedorov-An`
- `ITHUBterraforubuntuper2-$Fedorov-An`
- `ITHUBterraforubuntuper3-$Fedorov-An`

Каждая виртуальная машина:
- OS: CentOS 7.
- Дисковое пространство: 10 GB.
- Каждая виртуальная машина была подключена к подсети и получила фиксированный IP-адрес:
  - 192.168.250.101 для первой машины.
  - 192.168.250.102 для второй машины.
  - 192.168.250.103 для третьей машины.

### 2. Создание сети
Для виртуальных машин была создана сеть с именем `ITHUBterraformnetwork-$Fedorov-An`. В сети была создана подсеть с адресом `192.168.250.0/24`. Все машины были подключены к этой подсети.

### 3. Создание маршрутизатора
Создан новый маршрутизатор с именем `ITHUBterraformrouter-$Fedorov-An`.

### 4. Настройка безопасности
Для виртуальных машин была добавлена группа безопасности, которая разрешает:
- Входящий трафик на порты 22 (TCP), 80 (TCP), 443 (TCP).
- Исходящий трафик на порт 53 (UDP) для DNS-запросов.

### 5. Конфигурация виртуальных машин
С помощью `cloud-init` была настроена автоматическая установка необходимых пакетов на виртуальные машины:
- Установлены `curl`, `wget` и `nginx`.

### 6. Вывод на output
После выполнения Terraform манифеста были выведены значения:
