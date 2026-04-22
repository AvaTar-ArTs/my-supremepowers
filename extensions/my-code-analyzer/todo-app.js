// 애플리케이션 상태 관리
class TodoApp {
  constructor() {
    // 상태 변수 초기화
    this.todos = [];
    this.currentFilter = 'all';
    this.nextId = 1;

    // DOM 요소 참조
    this.elements = {
      form: document.getElementById('todoForm'),
      input: document.getElementById('todoInput'),
      todoList: document.getElementById('todoList'),
      emptyState: document.getElementById('emptyState'),
      totalCount: document.getElementById('totalCount'),
      completedCount: document.getElementById('completedCount'),
      remainingCount: document.getElementById('remainingCount'),
      filterButtons: document.querySelectorAll('.filter-btn'),
      clearCompletedBtn: document.getElementById('clearCompleted'),
      markAllCompleteBtn: document.getElementById('markAllComplete')
    };

    // 이벤트 리스너 바인딩
    this.bindEvents();

    // 앱 초기화
    this.init();
  }

  // 이벤트 리스너 바인딩
  bindEvents() {
    // 폼 제출 이벤트
    this.elements.form.addEventListener('submit', (e) => {
      e.preventDefault();
      this.addTodo();
    });

    // 필터 버튼 클릭 이벤트
    this.elements.filterButtons.forEach(button => {
      button.addEventListener('click', (e) => {
        this.setFilter(e.target.dataset.filter);
      });
    });

    // 일괄 작업 버튼 이벤트
    this.elements.clearCompletedBtn.addEventListener('click', () => {
      this.clearCompleted();
    });

    this.elements.markAllCompleteBtn.addEventListener('click', () => {
      this.toggleAllComplete();
    });

    // 키보드 단축키
    document.addEventListener('keydown', (e) => {
      if (e.ctrlKey && e.key === 'Enter') {
        this.elements.input.focus();
      }
    });
  }

  // 앱 초기화
  init() {
    this.loadFromStorage();
    this.render();
    this.updateStats();
  }

  // 로컬 스토리지에서 데이터 로드
  loadFromStorage() {
    try {
      const storedData = localStorage.getItem('todos');
      if (storedData) {
        const parsedData = JSON.parse(storedData);
        this.todos = parsedData.todos || [];
        this.nextId = parsedData.nextId || 1;
      }
    } catch (error) {
      console.error('데이터 로드 중 오류 발생:', error);
      this.todos = [];
      this.nextId = 1;
    }
  }

  // 로컬 스토리지에 데이터 저장
  saveToStorage() {
    try {
      const dataToSave = {
        todos: this.todos,
        nextId: this.nextId
      };
      localStorage.setItem('todos', JSON.stringify(dataToSave));
    } catch (error) {
      console.error('데이터 저장 중 오류 발생:', error);
    }
  }

  // 새 할 일 추가
  addTodo() {
    const text = this.elements.input.value.trim();

    if (!text) {
      this.showMessage('할 일을 입력해주세요.');
      return;
    }

    const newTodo = {
      id: this.nextId++,
      text: text,
      completed: false,
      createdAt: new Date().toISOString()
    };

    this.todos.unshift(newTodo);
    this.elements.input.value = '';

    this.saveToStorage();
    this.render();
    this.updateStats();

    this.showMessage('할 일이 추가되었습니다.');
  }

  // 할 일 삭제
  deleteTodo(id) {
    const todoIndex = this.todos.findIndex(todo => todo.id === id);
    if (todoIndex === -1) return;

    const todoText = this.todos[todoIndex].text;
    this.todos.splice(todoIndex, 1);

    this.saveToStorage();
    this.render();
    this.updateStats();

    this.showMessage(`"${todoText}"이(가) 삭제되었습니다.`);
  }

  // 할 일 완료 상태 토글
  toggleTodo(id) {
    const todo = this.todos.find(todo => todo.id === id);
    if (!todo) return;

    todo.completed = !todo.completed;

    this.saveToStorage();
    this.render();
    this.updateStats();
  }

  // 모든 할 일 완료 상태 토글
  toggleAllComplete() {
    const allCompleted = this.todos.length > 0 && this.todos.every(todo => todo.completed);

    this.todos.forEach(todo => {
      todo.completed = !allCompleted;
    });

    this.saveToStorage();
    this.render();
    this.updateStats();

    const message = allCompleted ? '모든 할 일이 미완료 처리되었습니다.' : '모든 할 일이 완료 처리되었습니다.';
    this.showMessage(message);
  }

  // 완료된 할 일 모두 삭제
  clearCompleted() {
    const completedCount = this.todos.filter(todo => todo.completed).length;

    if (completedCount === 0) {
      this.showMessage('완료된 할 일이 없습니다.');
      return;
    }

    if (confirm(`${completedCount}개의 완료된 할 일을 삭제하시겠습니까?`)) {
      this.todos = this.todos.filter(todo => !todo.completed);

      this.saveToStorage();
      this.render();
      this.updateStats();

      this.showMessage(`${completedCount}개의 완료된 할 일이 삭제되었습니다.`);
    }
  }

  // 필터 설정
  setFilter(filter) {
    this.currentFilter = filter;

    // 필터 버튼 활성 상태 업데이트
    this.elements.filterButtons.forEach(button => {
      button.classList.toggle('active', button.dataset.filter === filter);
    });

    this.render();
  }

  // 필터링된 할 일 목록 가져오기
  getFilteredTodos() {
    switch (this.currentFilter) {
      case 'active':
        return this.todos.filter(todo => !todo.completed);
      case 'completed':
        return this.todos.filter(todo => todo.completed);
      default:
        return this.todos;
    }
  }

  // 할 일 목록 렌더링
  render() {
    const filteredTodos = this.getFilteredTodos();
    const todoList = this.elements.todoList;
    const emptyState = this.elements.emptyState;

    // 목록 비우기
    todoList.innerHTML = '';

    // 빈 상태 표시
    if (filteredTodos.length === 0) {
      emptyState.classList.add('show');

      // 빈 상태 메시지 필터에 따라 변경
      const emptyMessage = emptyState.querySelector('.empty-message');
      const emptySubmessage = emptyState.querySelector('.empty-submessage');

      switch (this.currentFilter) {
        case 'active':
          emptyMessage.textContent = '진행 중인 할 일이 없습니다.';
          emptySubmessage.textContent = '모든 할 일이 완료되었습니다!';
          break;
        case 'completed':
          emptyMessage.textContent = '완료된 할 일이 없습니다.';
          emptySubmessage.textContent = '완료된 할 일이 여기에 표시됩니다.';
          break;
        default:
          emptyMessage.textContent = '아직 할 일이 없습니다.';
          emptySubmessage.textContent = '첫 번째 할 일을 추가해보세요!';
      }
    } else {
      emptyState.classList.remove('show');

      // 할 일 항목 생성
      filteredTodos.forEach(todo => {
        const todoItem = this.createTodoElement(todo);
        todoList.appendChild(todoItem);
      });
    }

    // 일괄 작업 버튼 상태 업데이트
    this.updateBulkActionButtons();
  }

  // 할 일 요소 생성
  createTodoElement(todo) {
    const li = document.createElement('li');
    li.className = `todo-item ${todo.completed ? 'completed' : ''}`;
    li.dataset.id = todo.id;

    const checkbox = document.createElement('input');
    checkbox.type = 'checkbox';
    checkbox.className = 'todo-checkbox';
    checkbox.checked = todo.completed;
    checkbox.addEventListener('change', () => this.toggleTodo(todo.id));

    const text = document.createElement('span');
    text.className = 'todo-text';
    text.textContent = todo.text;

    const date = document.createElement('span');
    date.className = 'todo-date';
    date.textContent = this.formatDate(todo.createdAt);

    const deleteBtn = document.createElement('button');
    deleteBtn.className = 'delete-btn';
    deleteBtn.innerHTML = '✕';
    deleteBtn.setAttribute('aria-label', '할 일 삭제');
    deleteBtn.addEventListener('click', () => this.deleteTodo(todo.id));

    li.appendChild(checkbox);
    li.appendChild(text);
    li.appendChild(date);
    li.appendChild(deleteBtn);

    return li;
  }

  // 날짜 포맷팅
  formatDate(dateString) {
    const date = new Date(dateString);
    const today = new Date();
    const yesterday = new Date(today);
    yesterday.setDate(yesterday.getDate() - 1);

    if (date.toDateString() === today.toDateString()) {
      return '오늘';
    } else if (date.toDateString() === yesterday.toDateString()) {
      return '어제';
    } else {
      return date.toLocaleDateString('ko-KR', {
        month: 'short',
        day: 'numeric'
      });
    }
  }

  // 통계 정보 업데이트
  updateStats() {
    const total = this.todos.length;
    const completed = this.todos.filter(todo => todo.completed).length;
    const remaining = total - completed;

    this.elements.totalCount.textContent = total;
    this.elements.completedCount.textContent = completed;
    this.elements.remainingCount.textContent = remaining;
  }

  // 일괄 작업 버튼 상태 업데이트
  updateBulkActionButtons() {
    const completedCount = this.todos.filter(todo => todo.completed).length;
    const totalCount = this.todos.length;

    // 완료된 항목 삭제 버튼
    this.elements.clearCompletedBtn.disabled = completedCount === 0;

    // 모두 완료 버튼
    if (totalCount === 0) {
      this.elements.markAllCompleteBtn.disabled = true;
      this.elements.markAllCompleteBtn.textContent = '모두 완료';
    } else if (completedCount === totalCount) {
      this.elements.markAllCompleteBtn.disabled = false;
      this.elements.markAllCompleteBtn.textContent = '모두 미완료';
    } else {
      this.elements.markAllCompleteBtn.disabled = false;
      this.elements.markAllCompleteBtn.textContent = '모두 완료';
    }
  }

  // 메시지 표시
  showMessage(message) {
    // 기존 메시지 제거
    const existingMessage = document.querySelector('.toast-message');
    if (existingMessage) {
      existingMessage.remove();
    }

    // 새 메시지 생성
    const messageElement = document.createElement('div');
    messageElement.className = 'toast-message';
    messageElement.textContent = message;

    // 스타일 적용
    Object.assign(messageElement.style, {
      position: 'fixed',
      bottom: '20px',
      left: '50%',
      transform: 'translateX(-50%)',
      background: 'var(--text-primary)',
      color: 'var(--text-white)',
      padding: '12px 24px',
      borderRadius: '8px',
      fontSize: '14px',
      fontWeight: '500',
      boxShadow: 'var(--shadow-lg)',
      zIndex: '1000',
      opacity: '0',
      transition: 'opacity 0.3s ease',
      pointerEvents: 'none'
    });

    document.body.appendChild(messageElement);

    // 애니메이션 효과
    requestAnimationFrame(() => {
      messageElement.style.opacity = '1';
    });

    // 자동 제거
    setTimeout(() => {
      messageElement.style.opacity = '0';
      setTimeout(() => {
        if (messageElement.parentNode) {
          messageElement.parentNode.removeChild(messageElement);
        }
      }, 300);
    }, 2000);
  }

  // 데이터 내보내기 (백업용)
  exportData() {
    const dataStr = JSON.stringify({
      todos: this.todos,
      nextId: this.nextId,
      exportDate: new Date().toISOString()
    }, null, 2);

    const dataBlob = new Blob([dataStr], { type: 'application/json' });
    const url = URL.createObjectURL(dataBlob);

    const link = document.createElement('a');
    link.href = url;
    link.download = `todos-backup-${new Date().toISOString().split('T')[0]}.json`;

    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);

    URL.revokeObjectURL(url);
    this.showMessage('데이터가 내보내기되었습니다.');
  }

  // 데이터 가져오기 (복원용)
  importData(jsonData) {
    try {
      const importedData = typeof jsonData === 'string' ? JSON.parse(jsonData) : jsonData;

      if (importedData.todos && Array.isArray(importedData.todos)) {
        if (confirm('가져온 데이터로 현재 할 일 목록을 덮어쓰시겠습니까?')) {
          this.todos = importedData.todos;
          this.nextId = importedData.nextId || Math.max(...this.todos.map(t => t.id), 0) + 1;

          this.saveToStorage();
          this.render();
          this.updateStats();

          this.showMessage('데이터가 성공적으로 가져와졌습니다.');
        }
      } else {
        throw new Error('유효하지 않은 데이터 형식입니다.');
      }
    } catch (error) {
      console.error('데이터 가져오기 중 오류:', error);
      this.showMessage('데이터 가져오기에 실패했습니다.');
    }
  }
}

// 애플리케이션 초기화
document.addEventListener('DOMContentLoaded', () => {
  // 전역 앱 인스턴스 생성
  window.todoApp = new TodoApp();

  // 개발자 모드에서 디버깅 기능 추가
  if (window.location.hostname === 'localhost' || window.location.hostname === '127.0.0.1') {
    console.log('Todo App이 초기화되었습니다.');
    console.log('사용 가능한 명령어:');
    console.log('- todoApp.exportData(): 데이터 내보내기');
    console.log('- todoApp.importData(jsonData): 데이터 가져오기');

    // 단축키 추가
    document.addEventListener('keydown', (e) => {
      // Ctrl+Shift+E: 데이터 내보내기
      if (e.ctrlKey && e.shiftKey && e.key === 'E') {
        e.preventDefault();
        window.todoApp.exportData();
      }
    });
  }

  // PWA 기능 지원 확인
  if ('serviceWorker' in navigator) {
    console.log('Service Worker를 지원합니다.');
  }

  // 오프라인 상태 감지
  window.addEventListener('online', () => {
    window.todoApp.showMessage('온라인 상태입니다.');
  });

  window.addEventListener('offline', () => {
    window.todoApp.showMessage('오프라인 상태입니다. 데이터는 로컬에 저장됩니다.');
  });
});

// 에러 핸들링
window.addEventListener('error', (event) => {
  console.error('앱 실행 중 오류 발생:', event.error);
});

window.addEventListener('unhandledrejection', (event) => {
  console.error('처리되지 않은 Promise 거부:', event.reason);
});