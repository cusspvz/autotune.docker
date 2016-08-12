## Upcoming

- Build was going wrong because Dockerfile RUN statements were not chaining
their state.
- Add tcp_challenge_ack_limit variable to bypass linux kernel tcp ack exploit

## 1.1.0

- Add DOCKER tuner

## 1.0.2

- Use net instead since proc mount didn't worked for tcp tuning.

## 1.0.1

- Force user to mount proc on container

## 1.0.0

- Initial Release
- Created 2 tuners:
  * CACHE - drops kernel's cache
  * TCP - handle's TCP configuration
