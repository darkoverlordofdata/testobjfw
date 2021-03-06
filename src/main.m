#import <Foundation/Foundation.h>
#import <GL/glew.h>
#import <GLFW/glfw3.h>
#import <Game.h>
#import <Texture2D.h>

// The Width of the screen
const GLuint SCREEN_WIDTH = 800;
// The height of the screen
const GLuint SCREEN_HEIGHT = 600;

void key_callback(GLFWwindow* window, int key, int scancode, int action, int mode);

Game* Breakout;

int main(int argc, char *argv[]) 
{
    @autoreleasepool {

        if (!glfwInit())
        {
            OFLog("Failed glfwInit");
            return 1;
        }

        glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
        glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
        glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
        glfwWindowHint(GLFW_RESIZABLE, GL_FALSE);

        GLFWwindow* window = glfwCreateWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "Breakout", nullptr, nullptr);
        glfwMakeContextCurrent(window);

        glewExperimental = GL_TRUE;
        glewInit();
        glGetError(); // Call it once to catch glewInit() bug, all other errors are now from our application.

        glfwSetKeyCallback(window, key_callback);

        // OpenGL configuration
        glViewport(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        glEnable(GL_CULL_FACE);
        glEnable(GL_BLEND);
        glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

        // DeltaTime variables
        GLfloat deltaTime = 0.0f;
        GLfloat lastFrame = 0.0f;

        // Initialize game
        Breakout = [[Game alloc] initWithWidth:SCREEN_WIDTH Height:SCREEN_HEIGHT];
        [Breakout Start];
        [Breakout SetState:GAME_ACTIVE];

        while (!glfwWindowShouldClose(window))
        {
            // Calculate delta time
            GLfloat currentFrame = glfwGetTime();
            deltaTime = currentFrame - lastFrame;
            lastFrame = currentFrame;
            glfwPollEvents();

            // Manage user input
            [Breakout ProcessInput:deltaTime];
            // Update Game state
            [Breakout Update:deltaTime];

            glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
            glClear(GL_COLOR_BUFFER_BIT);
            [Breakout Render];
            glfwSwapBuffers(window);
        }
    }
    glfwTerminate();
    return 0;
}

void key_callback(GLFWwindow* window, int key, int scancode, int action, int mode)
{
    // When a user presses the escape key, 
    // we set the WindowShouldClose property to true, closing the application
    if (key == GLFW_KEY_ESCAPE && action == GLFW_PRESS)
        glfwSetWindowShouldClose(window, true);
    if (key >= 0 && key < 1024)
    {
        if (action == GLFW_PRESS)
            [Breakout SetKey:key Value:true];
        else if (action == GLFW_RELEASE)
            [Breakout SetKey:key Value:false];
    }
}
